package com.yakindu.sct.examples.musicplayer.java.player;

import com.yakindu.sct.examples.musicplayer.java.IStatemachine;
import com.yakindu.sct.examples.musicplayer.java.MusicPlayer;
import com.yakindu.sct.examples.musicplayer.java.Song;
import java.util.ArrayList;
import java.util.List;

public interface IPlayerStatemachine extends IStatemachine {
	public interface SCInterface {
	
		public void raisePlayPressed();
		
		public void raisePausePressed();
		
		public void raiseStopPressed();
		
		public void raisePrevPressed();
		
		public void raiseNextPressed();
		
		public boolean isRaisedPlayBtnEnabled();
		
		public boolean getPlayBtnEnabledValue();
		
		public boolean isRaisedPauseBtnEnabled();
		
		public boolean getPauseBtnEnabledValue();
		
		public boolean isRaisedStopBtnEnabled();
		
		public boolean getStopBtnEnabledValue();
		
		public MusicPlayer getPlayer();
		
		public void setPlayer(MusicPlayer value);
		
		public ArrayList<Song> getPlaylist();
		
		public void setPlaylist(ArrayList<Song> value);
		
		public Song getCurrentSong();
		
		public void setCurrentSong(Song value);
		
	public List<SCInterfaceListener> getListeners();
	}
	
	public interface SCInterfaceListener {
	
		public void onPlayBtnEnabledRaised(boolean value);
		public void onPauseBtnEnabledRaised(boolean value);
		public void onStopBtnEnabledRaised(boolean value);
		}
	
	public SCInterface getSCInterface();
	
}
