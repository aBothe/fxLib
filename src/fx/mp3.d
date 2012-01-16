/**
* mp3 module written by Alexander Bothe (alexanderbothe.com) 2009
*/
module fx.mp3;

import std.utf, std.string, core.thread, fx.libwmp3, std.c.windows.windows;
package alias std.string.toStringz toz;

///Encapsulates complete libwmp3-library
class MP3Player
{
public:
	static enum ID3Version///
	{
		ID3v1=1,///
		ID3v2=2///
	}
	static enum ID3Field///
	{
		Title =1,///
		Artist =2,///
		Album =4,///
		Genre =8,///
		Comment =16,///
		TrackNum =32,///
		Year =64///
	}

	static enum WaveFormat:uint{///
		mono_11_025kHz_8bit	=1		/// 11.025 kHz, mono, 8-bit
		,mono_11_025kHz_16bit	=2		/// 11.025 kHz, mono, 16-bit
		,stereo_11_025kHz_8bit	=4		/// 11.025 kHz, stereo, 8-bit
		,stereo_11_025kHz_16bit	=8		/// 11.025 kHz, stereo, 16-bit

		,mono_22_05kHz_8bit	=16		/// 22.05 kHz, mono, 8-bit
		,mono_22_05kHz_16bit	=32		/// 22.05 kHz, mono, 16-bit
		,stereo_22_05kHz_8bit	=64		/// 22.05 kHz, stereo, 8-bit
		,stereo_22_05kHz_16bit	=128		// 22.05 kHz, stereo, 16-bit

		,mono_44_1kHz_8bit	=256		/// 44.1 kHz, mono, 8-bit
		,mono_44_1kHz_16bit	=512		/// 44.1 kHz, mono, 16-bit
		,stereo_44_1kHz_8bit	=1024	/// 44.1 kHz, stereo, 8-bit
		,stereo_44_1kHz_16bit	=2048	/// 44.1 kHz, stereo, 16-bit
	}
	static enum WaveSupport:uint{///
		LeftRightSeperation =8			/// Supports separate left and right volume control.
		,Pitch =1			/// Supports pitch control.
		,PlayBackRateControl =2		/// Supports playback rate control.
		,Sync =16			/// The driver is synchronous and will block while playing a buffer.
		,VolumeControl	=4			/// Supports volume control.
		,SampleAccuratePositionInfo	=32	/// Returns sample-accurate position information.
		,DirectSound =64		///
	}
	static struct DeviceInfo{
		uint ManufacturerID;	/// Manufacturer identifier for the device driver for the device.
		uint ProductID;			/// Product identifier for the device.
		uint DriverVersion;		/// Version number of the device driver for the device.
		uint Formats;			/// Standard formats that are supported. Can be a combination of values.
		uint Channels;			/// Number specifying whether the device supports mono (1) or stereo (2) output.
		uint Support;			/// Optional functionality supported by the device.
		char[32] ProductName;	/// Product name in a null-terminated string.
	};

	static enum SeekMethod{///
		FromBegin =1,///
		FromEnd =2,///
		Forward =4,///
		Backward =8///
	}

public:
	static void PlayFile(S)(S s)///
	{
		MP3Player mp=new MP3Player();
		mp.Open(s);
		uint len=mp.Duration;
		mp.Play();
		Thread.sleep(len*10000);
		mp.Close();
		delete mp;
	}
	static MP3Player PlayFileAsync(S)(S s)///
	{
		MP3Player mp=new MP3Player();
		mp.Open(s);
		uint len=mp.Duration;
		mp.Play();
		return mp;
	}

	this()	{	h=Mp3_Initialize();	}
	~this()	{	Mp3_Destroy(h);	}


	WMP3_HANDLE Handle() ///
	{	return h;	}



	//get library version
	int Version()
	{	return Mp3_GetVersion(h);	}



	string GetError()///
	{
		int n=Mp3_GetError(h,null,0);
		char[] msg=new char[n];
		Mp3_GetError(h,msg.ptr,n);
		return cast(string)msg;
	}



	///get ID3 field
	string GetID3Field(ID3Field field,ID3Version ver=ID3Version.ID3v1)
	{
		int n=Mp3_GetID3Field(	h,	cast(int)ver,	cast(int) field,	null, 0);
		char[] s=new char[n];
		Mp3_GetID3Field(	h,	cast(int)ver,	cast(int) field,	s.ptr, n);
		return cast(string)s;
	}



	///open mp3 file from disk to play, seek from begining of file, set custom file size
	bool Open(string s,int bufferLength=800, uint seek=0, uint fileSize=0)
	{
		return cast(bool)Mp3_OpenFile(h,toz(s),bufferLength,seek,fileSize);
	}
	///ditto
	bool Open(wstring s,int bufferLength=800, uint seek=0, uint fileSize=0)
	{
		return cast(bool)Mp3_OpenFileW(h,cast(wchar*)s,bufferLength,seek,fileSize);
	}

	///open mp3 stream from application resource
	bool OpenResource(string name, string resourceType, HINSTANCE inst, int bufferLength=800, uint seek=0, uint fileSize=0)
	{
		return cast(bool)Mp3_OpenResource(h,inst,toz(name),toz(resourceType),bufferLength,seek,fileSize);
	}

	///close mp3
	void Close()	{	Mp3_Close(h);	}



	///enumerate waveform-audio output devices
	uint CountOutputDevices()	{	return cast(uint) Mp3_EnumerateWaveOut(h);	}

	DeviceInfo GetDeviceInfo(uint n)///
	{
		WAVEOUT_INFO wi;
		Mp3_GetWaveOutInfo(h,n,&wi);
		return cast(DeviceInfo)wi;
	}

	void SetOutputDevice(uint n)///
	{	Mp3_SetWaveOutDevice(h,n);	}



	void Play()	{	Mp3_Play(h);	}///
	void Pause()	{	Mp3_Pause(h);	}///
	void Stop()	{	Mp3_Stop(h);	}///
	void Resume()	{	Mp3_Resume(h);	}///



	uint Position()///
	{
		scope MP3_TIME t;
		Mp3_GetPosition(h,t);
		return t.ms;
	}

	void Position(uint ms, SeekMethod met=SeekMethod.FromBegin)///
	{
		scope MP3_TIME t;
		t.ms=ms;
		Mp3_Seek(h, TIME_FORMAT_MS, &t, cast(int)met);
	}

	uint Duration()///
	{
		MP3_TIME t;
		Mp3_GetSongLength(h,t);
		return t.ms;
	}


	void VolumeControlEnabled(bool b)///
	{	Mp3_InternalVolume(h,cast(int)b);		}
	void Volume(uint left,uint right)///
	{	Mp3_SetVolume(h,left,right);	}
	void Volume(uint v)///ditto
	{	Mp3_SetVolume(h,v,v);	}
	uint Volume()///ditto
	{
		uint l,r;
		Mp3_GetVolume(h,l,r);
		return l;
	}
	void Volume(out uint left, out uint right)///ditto
	{	Mp3_GetVolume(h,left,right);	}



	uint BitRate(bool average=true)///
	{	return cast(uint) Mp3_GetBitrate(h,cast(int)average);	}



	bool isPlaying()///
	{
		MP3_STATUS st;
		Mp3_GetStatus(h,st);
		return cast(bool)st.fPlay;
	}

	bool isPaused()///
	{
		MP3_STATUS st;
		Mp3_GetStatus(h,st);
		return cast(bool)st.fPause;
	}

	bool isStopped()///
	{
		MP3_STATUS st;
		Mp3_GetStatus(h,st);
		return cast(bool)st.fStop;
	}



	void ChannelMix(bool enabled, uint left, uint right)///
	{	Mp3_MixChannels(h,cast(int)enabled,left,right);	}

	void ChannelLoad(out uint left, out uint right)///
	{	Mp3_GetVUData(h,left,right);	}

	void VocalCut(bool b)///
	{	Mp3_VocalCut(h,cast(int)b);	}

	void SetFade(uint ms,bool FadeIn=true)///
	{
		MP3_TIME t;
		t.ms=ms;
		Mp3_FadeVolume(h,FadeIn?FADE_IN:FADE_OUT, TIME_FORMAT_MS,t);
	}

	void EnableEqualizer(bool b=true,bool external=true)///
	{	Mp3_EnableEQ(h, cast(int)b, cast(int)external);	}
	void EQBands(uint[] bandFrequencies)///
	{	Mp3_CreateEqBands(h,cast(int*)bandFrequencies.ptr,bandFrequencies.length);	}
	uint[] EQBands()///
	{
		int* ret;
		int n=Mp3_GetEqBands(h,ret);
		return cast(uint[])ret[0 .. n];
	}
	void SetEQAmplifiers(bool external, int preAmp, int[] bandAmps)///
	{	Mp3_SetEQParam(h, cast(int)external, preAmp, bandAmps.ptr, bandAmps.length);	}
	int[] GetEQAmplifiers(bool external, out int preAmp)///
	{
		int* ret;
		int n=Mp3_GetEQParam(h, cast(int)external, preAmp, ret);
		return ret[0 .. n];
	}

package:
	WMP3_HANDLE h;
}
