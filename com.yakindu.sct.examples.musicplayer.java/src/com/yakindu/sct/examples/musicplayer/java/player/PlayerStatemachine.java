package com.yakindu.sct.examples.musicplayer.java.player;

import com.yakindu.sct.examples.musicplayer.java.MusicPlayer;
import com.yakindu.sct.examples.musicplayer.java.Song;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class PlayerStatemachine implements IPlayerStatemachine {
	protected class SCInterfaceImpl implements SCInterface {
	
		private List<SCInterfaceListener> listeners = new LinkedList<SCInterfaceListener>();
		
		public List<SCInterfaceListener> getListeners() {
			return listeners;
		}
		private boolean playPressed;
		
		public void raisePlayPressed() {
			playPressed = true;
			runCycle();
		}
		
		private boolean pausePressed;
		
		public void raisePausePressed() {
			pausePressed = true;
			runCycle();
		}
		
		private boolean stopPressed;
		
		public void raiseStopPressed() {
			stopPressed = true;
			runCycle();
		}
		
		private boolean prevPressed;
		
		public void raisePrevPressed() {
			prevPressed = true;
			runCycle();
		}
		
		private boolean nextPressed;
		
		public void raiseNextPressed() {
			nextPressed = true;
			runCycle();
		}
		
		private boolean playBtnEnabled;
		
		private boolean playBtnEnabledValue;
		
		public boolean isRaisedPlayBtnEnabled() {
			return playBtnEnabled;
		}
		
		protected void raisePlayBtnEnabled(boolean value) {
			playBtnEnabled = true;
			playBtnEnabledValue = value;
			for (SCInterfaceListener listener : listeners) {
				listener.onPlayBtnEnabledRaised(value);
			}
		}
		
		public boolean getPlayBtnEnabledValue() {
			if (! playBtnEnabled ) 
				throw new IllegalStateException("Illegal event value access. Event PlayBtnEnabled is not raised!");
			return playBtnEnabledValue;
		}
		
		private boolean pauseBtnEnabled;
		
		private boolean pauseBtnEnabledValue;
		
		public boolean isRaisedPauseBtnEnabled() {
			return pauseBtnEnabled;
		}
		
		protected void raisePauseBtnEnabled(boolean value) {
			pauseBtnEnabled = true;
			pauseBtnEnabledValue = value;
			for (SCInterfaceListener listener : listeners) {
				listener.onPauseBtnEnabledRaised(value);
			}
		}
		
		public boolean getPauseBtnEnabledValue() {
			if (! pauseBtnEnabled ) 
				throw new IllegalStateException("Illegal event value access. Event PauseBtnEnabled is not raised!");
			return pauseBtnEnabledValue;
		}
		
		private boolean stopBtnEnabled;
		
		private boolean stopBtnEnabledValue;
		
		public boolean isRaisedStopBtnEnabled() {
			return stopBtnEnabled;
		}
		
		protected void raiseStopBtnEnabled(boolean value) {
			stopBtnEnabled = true;
			stopBtnEnabledValue = value;
			for (SCInterfaceListener listener : listeners) {
				listener.onStopBtnEnabledRaised(value);
			}
		}
		
		public boolean getStopBtnEnabledValue() {
			if (! stopBtnEnabled ) 
				throw new IllegalStateException("Illegal event value access. Event StopBtnEnabled is not raised!");
			return stopBtnEnabledValue;
		}
		
		private MusicPlayer player;
		
		public MusicPlayer getPlayer() {
			return player;
		}
		
		public void setPlayer(MusicPlayer value) {
			this.player = value;
		}
		
		private ArrayList<Song> playlist;
		
		public ArrayList<Song> getPlaylist() {
			return playlist;
		}
		
		public void setPlaylist(ArrayList<Song> value) {
			this.playlist = value;
		}
		
		private Song currentSong;
		
		public Song getCurrentSong() {
			return currentSong;
		}
		
		public void setCurrentSong(Song value) {
			this.currentSong = value;
		}
		
		protected void clearEvents() {
			playPressed = false;
			pausePressed = false;
			stopPressed = false;
			prevPressed = false;
			nextPressed = false;
		}
		protected void clearOutEvents() {
		
		playBtnEnabled = false;
		pauseBtnEnabled = false;
		stopBtnEnabled = false;
		}
		
	}
	
	protected SCInterfaceImpl sCInterface;
	
	private boolean initialized = false;
	
	public enum State {
		player_MusicPlayer,
		player_MusicPlayer_inner_region_Ready,
		player_MusicPlayer_inner_region_Composite_Playing_Paused,
		player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing,
		player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused,
		playButton_Enabled,
		playButton_Disabled,
		pauseButton_Enabled,
		pauseButton_Disabled,
		stopButton_Enabled,
		stopButton_Disabled,
		$NullState$
	};
	
	private final State[] stateVector = new State[4];
	
	private int nextStateIndex;
	
	
	private int current;
	
	protected void setCurrent(int value) {
		current = value;
	}
	
	protected int getCurrent() {
		return current;
	}
	
	public PlayerStatemachine() {
		sCInterface = new SCInterfaceImpl();
	}
	
	public void init() {
		this.initialized = true;
		for (int i = 0; i < 4; i++) {
			stateVector[i] = State.$NullState$;
		}
		clearEvents();
		clearOutEvents();
		setCurrent(0);
	}
	
	public void enter() {
		if (!initialized) {
			throw new IllegalStateException(
				"The state machine needs to be initialized first by calling the init() function."
			);
		}
		sCInterface.getPlaylist().add(Song.from("Jingle1.wav"));
		
		sCInterface.getPlaylist().add(Song.from("Jingle2.wav"));
		
		enterSequence_Player_default();
		enterSequence_PlayButton_default();
		enterSequence_PauseButton_default();
		enterSequence_StopButton_default();
	}
	
	public void runCycle() {
		if (!initialized)
			throw new IllegalStateException(
					"The state machine needs to be initialized first by calling the init() function.");
		clearOutEvents();
		for (nextStateIndex = 0; nextStateIndex < stateVector.length; nextStateIndex++) {
			switch (stateVector[nextStateIndex]) {
			case player_MusicPlayer_inner_region_Ready:
				player_MusicPlayer_inner_region_Ready_react(true);
				break;
			case player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing:
				player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing_react(true);
				break;
			case player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused:
				player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused_react(true);
				break;
			case playButton_Enabled:
				playButton_Enabled_react(true);
				break;
			case playButton_Disabled:
				playButton_Disabled_react(true);
				break;
			case pauseButton_Enabled:
				pauseButton_Enabled_react(true);
				break;
			case pauseButton_Disabled:
				pauseButton_Disabled_react(true);
				break;
			case stopButton_Enabled:
				stopButton_Enabled_react(true);
				break;
			case stopButton_Disabled:
				stopButton_Disabled_react(true);
				break;
			default:
				// $NullState$
			}
		}
		clearEvents();
	}
	public void exit() {
		exitSequence_Player();
		exitSequence_PlayButton();
		exitSequence_PauseButton();
		exitSequence_StopButton();
	}
	
	/**
	 * @see IStatemachine#isActive()
	 */
	public boolean isActive() {
		return stateVector[0] != State.$NullState$||stateVector[1] != State.$NullState$||stateVector[2] != State.$NullState$||stateVector[3] != State.$NullState$;
	}
	
	/** 
	* Always returns 'false' since this state machine can never become final.
	*
	* @see IStatemachine#isFinal()
	*/
	public boolean isFinal() {
		return false;
	}
	/**
	* This method resets the incoming events (time events included).
	*/
	protected void clearEvents() {
		sCInterface.clearEvents();
	}
	
	/**
	* This method resets the outgoing events.
	*/
	protected void clearOutEvents() {
		sCInterface.clearOutEvents();
	}
	
	/**
	* Returns true if the given state is currently active otherwise false.
	*/
	public boolean isStateActive(State state) {
	
		switch (state) {
		case player_MusicPlayer:
			return stateVector[0].ordinal() >= State.
					player_MusicPlayer.ordinal()&& stateVector[0].ordinal() <= State.player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused.ordinal();
		case player_MusicPlayer_inner_region_Ready:
			return stateVector[0] == State.player_MusicPlayer_inner_region_Ready;
		case player_MusicPlayer_inner_region_Composite_Playing_Paused:
			return stateVector[0].ordinal() >= State.
					player_MusicPlayer_inner_region_Composite_Playing_Paused.ordinal()&& stateVector[0].ordinal() <= State.player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused.ordinal();
		case player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing:
			return stateVector[0] == State.player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing;
		case player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused:
			return stateVector[0] == State.player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused;
		case playButton_Enabled:
			return stateVector[1] == State.playButton_Enabled;
		case playButton_Disabled:
			return stateVector[1] == State.playButton_Disabled;
		case pauseButton_Enabled:
			return stateVector[2] == State.pauseButton_Enabled;
		case pauseButton_Disabled:
			return stateVector[2] == State.pauseButton_Disabled;
		case stopButton_Enabled:
			return stateVector[3] == State.stopButton_Enabled;
		case stopButton_Disabled:
			return stateVector[3] == State.stopButton_Disabled;
		default:
			return false;
		}
	}
	
	public SCInterface getSCInterface() {
		return sCInterface;
	}
	
	public void raisePlayPressed() {
		sCInterface.raisePlayPressed();
	}
	
	public void raisePausePressed() {
		sCInterface.raisePausePressed();
	}
	
	public void raiseStopPressed() {
		sCInterface.raiseStopPressed();
	}
	
	public void raisePrevPressed() {
		sCInterface.raisePrevPressed();
	}
	
	public void raiseNextPressed() {
		sCInterface.raiseNextPressed();
	}
	
	public boolean isRaisedPlayBtnEnabled() {
		return sCInterface.isRaisedPlayBtnEnabled();
	}
	
	public boolean getPlayBtnEnabledValue() {
		return sCInterface.getPlayBtnEnabledValue();
	}
	
	public boolean isRaisedPauseBtnEnabled() {
		return sCInterface.isRaisedPauseBtnEnabled();
	}
	
	public boolean getPauseBtnEnabledValue() {
		return sCInterface.getPauseBtnEnabledValue();
	}
	
	public boolean isRaisedStopBtnEnabled() {
		return sCInterface.isRaisedStopBtnEnabled();
	}
	
	public boolean getStopBtnEnabledValue() {
		return sCInterface.getStopBtnEnabledValue();
	}
	
	public MusicPlayer getPlayer() {
		return sCInterface.getPlayer();
	}
	
	public void setPlayer(MusicPlayer value) {
		sCInterface.setPlayer(value);
	}
	
	public ArrayList<Song> getPlaylist() {
		return sCInterface.getPlaylist();
	}
	
	public void setPlaylist(ArrayList<Song> value) {
		sCInterface.setPlaylist(value);
	}
	
	public Song getCurrentSong() {
		return sCInterface.getCurrentSong();
	}
	
	public void setCurrentSong(Song value) {
		sCInterface.setCurrentSong(value);
	}
	
	/* Entry action for state 'Ready'. */
	private void entryAction_Player_MusicPlayer_inner_region_Ready() {
		sCInterface.setCurrentSong(sCInterface.playlist.get(getCurrent()));
	}
	
	/* Entry action for state 'Enabled'. */
	private void entryAction_PlayButton_Enabled() {
		sCInterface.raisePlayBtnEnabled(true);
	}
	
	/* Entry action for state 'Disabled'. */
	private void entryAction_PlayButton_Disabled() {
		sCInterface.raisePlayBtnEnabled(false);
	}
	
	/* Entry action for state 'Enabled'. */
	private void entryAction_PauseButton_Enabled() {
		sCInterface.raisePauseBtnEnabled(true);
	}
	
	/* Entry action for state 'Disabled'. */
	private void entryAction_PauseButton_Disabled() {
		sCInterface.raisePauseBtnEnabled(false);
	}
	
	/* Entry action for state 'Enabled'. */
	private void entryAction_StopButton_Enabled() {
		sCInterface.raiseStopBtnEnabled(true);
	}
	
	/* Entry action for state 'Disabled'. */
	private void entryAction_StopButton_Disabled() {
		sCInterface.raiseStopBtnEnabled(false);
	}
	
	/* 'default' enter sequence for state MusicPlayer */
	private void enterSequence_Player_MusicPlayer_default() {
		enterSequence_Player_MusicPlayer_inner_region_default();
	}
	
	/* 'default' enter sequence for state Ready */
	private void enterSequence_Player_MusicPlayer_inner_region_Ready_default() {
		entryAction_Player_MusicPlayer_inner_region_Ready();
		nextStateIndex = 0;
		stateVector[0] = State.player_MusicPlayer_inner_region_Ready;
	}
	
	/* 'default' enter sequence for state Composite_Playing_Paused */
	private void enterSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_default() {
		enterSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_default();
	}
	
	/* 'default' enter sequence for state Playing */
	private void enterSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing_default() {
		nextStateIndex = 0;
		stateVector[0] = State.player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing;
	}
	
	/* 'default' enter sequence for state Paused */
	private void enterSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused_default() {
		nextStateIndex = 0;
		stateVector[0] = State.player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused;
	}
	
	/* 'default' enter sequence for state Enabled */
	private void enterSequence_PlayButton_Enabled_default() {
		entryAction_PlayButton_Enabled();
		nextStateIndex = 1;
		stateVector[1] = State.playButton_Enabled;
	}
	
	/* 'default' enter sequence for state Disabled */
	private void enterSequence_PlayButton_Disabled_default() {
		entryAction_PlayButton_Disabled();
		nextStateIndex = 1;
		stateVector[1] = State.playButton_Disabled;
	}
	
	/* 'default' enter sequence for state Enabled */
	private void enterSequence_PauseButton_Enabled_default() {
		entryAction_PauseButton_Enabled();
		nextStateIndex = 2;
		stateVector[2] = State.pauseButton_Enabled;
	}
	
	/* 'default' enter sequence for state Disabled */
	private void enterSequence_PauseButton_Disabled_default() {
		entryAction_PauseButton_Disabled();
		nextStateIndex = 2;
		stateVector[2] = State.pauseButton_Disabled;
	}
	
	/* 'default' enter sequence for state Enabled */
	private void enterSequence_StopButton_Enabled_default() {
		entryAction_StopButton_Enabled();
		nextStateIndex = 3;
		stateVector[3] = State.stopButton_Enabled;
	}
	
	/* 'default' enter sequence for state Disabled */
	private void enterSequence_StopButton_Disabled_default() {
		entryAction_StopButton_Disabled();
		nextStateIndex = 3;
		stateVector[3] = State.stopButton_Disabled;
	}
	
	/* 'default' enter sequence for region Player */
	private void enterSequence_Player_default() {
		react_player_Player__entry_Default();
	}
	
	/* 'default' enter sequence for region inner region */
	private void enterSequence_Player_MusicPlayer_inner_region_default() {
		react_player_Player_MusicPlayer_inner_region__entry_Default();
	}
	
	/* 'default' enter sequence for region inner region */
	private void enterSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_default() {
		react_player_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region__entry_Default();
	}
	
	/* 'default' enter sequence for region PlayButton */
	private void enterSequence_PlayButton_default() {
		react_player_PlayButton__entry_Default();
	}
	
	/* 'default' enter sequence for region PauseButton */
	private void enterSequence_PauseButton_default() {
		react_player_PauseButton__entry_Default();
	}
	
	/* 'default' enter sequence for region StopButton */
	private void enterSequence_StopButton_default() {
		react_player_StopButton__entry_Default();
	}
	
	/* Default exit sequence for state MusicPlayer */
	private void exitSequence_Player_MusicPlayer() {
		exitSequence_Player_MusicPlayer_inner_region();
	}
	
	/* Default exit sequence for state Ready */
	private void exitSequence_Player_MusicPlayer_inner_region_Ready() {
		nextStateIndex = 0;
		stateVector[0] = State.$NullState$;
	}
	
	/* Default exit sequence for state Composite_Playing_Paused */
	private void exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused() {
		exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region();
	}
	
	/* Default exit sequence for state Playing */
	private void exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing() {
		nextStateIndex = 0;
		stateVector[0] = State.$NullState$;
	}
	
	/* Default exit sequence for state Paused */
	private void exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused() {
		nextStateIndex = 0;
		stateVector[0] = State.$NullState$;
	}
	
	/* Default exit sequence for state Enabled */
	private void exitSequence_PlayButton_Enabled() {
		nextStateIndex = 1;
		stateVector[1] = State.$NullState$;
	}
	
	/* Default exit sequence for state Disabled */
	private void exitSequence_PlayButton_Disabled() {
		nextStateIndex = 1;
		stateVector[1] = State.$NullState$;
	}
	
	/* Default exit sequence for state Enabled */
	private void exitSequence_PauseButton_Enabled() {
		nextStateIndex = 2;
		stateVector[2] = State.$NullState$;
	}
	
	/* Default exit sequence for state Disabled */
	private void exitSequence_PauseButton_Disabled() {
		nextStateIndex = 2;
		stateVector[2] = State.$NullState$;
	}
	
	/* Default exit sequence for state Enabled */
	private void exitSequence_StopButton_Enabled() {
		nextStateIndex = 3;
		stateVector[3] = State.$NullState$;
	}
	
	/* Default exit sequence for state Disabled */
	private void exitSequence_StopButton_Disabled() {
		nextStateIndex = 3;
		stateVector[3] = State.$NullState$;
	}
	
	/* Default exit sequence for region Player */
	private void exitSequence_Player() {
		switch (stateVector[0]) {
		case player_MusicPlayer_inner_region_Ready:
			exitSequence_Player_MusicPlayer_inner_region_Ready();
			break;
		case player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing:
			exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing();
			break;
		case player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused:
			exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused();
			break;
		default:
			break;
		}
	}
	
	/* Default exit sequence for region inner region */
	private void exitSequence_Player_MusicPlayer_inner_region() {
		switch (stateVector[0]) {
		case player_MusicPlayer_inner_region_Ready:
			exitSequence_Player_MusicPlayer_inner_region_Ready();
			break;
		case player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing:
			exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing();
			break;
		case player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused:
			exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused();
			break;
		default:
			break;
		}
	}
	
	/* Default exit sequence for region inner region */
	private void exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region() {
		switch (stateVector[0]) {
		case player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing:
			exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing();
			break;
		case player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused:
			exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused();
			break;
		default:
			break;
		}
	}
	
	/* Default exit sequence for region PlayButton */
	private void exitSequence_PlayButton() {
		switch (stateVector[1]) {
		case playButton_Enabled:
			exitSequence_PlayButton_Enabled();
			break;
		case playButton_Disabled:
			exitSequence_PlayButton_Disabled();
			break;
		default:
			break;
		}
	}
	
	/* Default exit sequence for region PauseButton */
	private void exitSequence_PauseButton() {
		switch (stateVector[2]) {
		case pauseButton_Enabled:
			exitSequence_PauseButton_Enabled();
			break;
		case pauseButton_Disabled:
			exitSequence_PauseButton_Disabled();
			break;
		default:
			break;
		}
	}
	
	/* Default exit sequence for region StopButton */
	private void exitSequence_StopButton() {
		switch (stateVector[3]) {
		case stopButton_Enabled:
			exitSequence_StopButton_Enabled();
			break;
		case stopButton_Disabled:
			exitSequence_StopButton_Disabled();
			break;
		default:
			break;
		}
	}
	
	/* Default react sequence for initial entry  */
	private void react_player_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region__entry_Default() {
		enterSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing_default();
	}
	
	/* Default react sequence for initial entry  */
	private void react_player_Player_MusicPlayer_inner_region__entry_Default() {
		enterSequence_Player_MusicPlayer_inner_region_Ready_default();
	}
	
	/* Default react sequence for initial entry  */
	private void react_player_Player__entry_Default() {
		enterSequence_Player_MusicPlayer_default();
	}
	
	/* Default react sequence for initial entry  */
	private void react_player_PlayButton__entry_Default() {
		enterSequence_PlayButton_Enabled_default();
	}
	
	/* Default react sequence for initial entry  */
	private void react_player_PauseButton__entry_Default() {
		enterSequence_PauseButton_Disabled_default();
	}
	
	/* Default react sequence for initial entry  */
	private void react_player_StopButton__entry_Default() {
		enterSequence_StopButton_Disabled_default();
	}
	
	private boolean react() {
		return false;
	}
	
	private boolean player_MusicPlayer_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (sCInterface.prevPressed) {
				exitSequence_Player_MusicPlayer();
				setCurrent((current==0) ? (sCInterface.playlist.size() - 1) : (((current - 1)) % sCInterface.playlist.size()));
				
				sCInterface.raiseStopPressed();
				
				sCInterface.getPlayer().stop();
				
				enterSequence_Player_MusicPlayer_inner_region_Ready_default();
			} else {
				if (sCInterface.nextPressed) {
					exitSequence_Player_MusicPlayer();
					setCurrent((((current + 1)) % sCInterface.playlist.size()));
					
					sCInterface.raiseStopPressed();
					
					sCInterface.getPlayer().stop();
					
					enterSequence_Player_MusicPlayer_inner_region_Ready_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean player_MusicPlayer_inner_region_Ready_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (sCInterface.playPressed) {
				exitSequence_Player_MusicPlayer_inner_region_Ready();
				sCInterface.getPlayer().play(sCInterface.getCurrentSong());
				
				enterSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_default();
				player_MusicPlayer_react(false);
			} else {
				did_transition = false;
			}
		}
		if (did_transition==false) {
			did_transition = player_MusicPlayer_react(try_transition);
		}
		return did_transition;
	}
	
	private boolean player_MusicPlayer_inner_region_Composite_Playing_Paused_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (sCInterface.stopPressed) {
				exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused();
				sCInterface.getPlayer().stop();
				
				enterSequence_Player_MusicPlayer_inner_region_Ready_default();
				player_MusicPlayer_react(false);
			} else {
				did_transition = false;
			}
		}
		if (did_transition==false) {
			did_transition = player_MusicPlayer_react(try_transition);
		}
		return did_transition;
	}
	
	private boolean player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (sCInterface.pausePressed) {
				exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing();
				sCInterface.getPlayer().pause();
				
				enterSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused_default();
				player_MusicPlayer_inner_region_Composite_Playing_Paused_react(false);
			} else {
				did_transition = false;
			}
		}
		if (did_transition==false) {
			did_transition = player_MusicPlayer_inner_region_Composite_Playing_Paused_react(try_transition);
		}
		return did_transition;
	}
	
	private boolean player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (sCInterface.playPressed) {
				exitSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Paused();
				sCInterface.getPlayer().resume();
				
				enterSequence_Player_MusicPlayer_inner_region_Composite_Playing_Paused_inner_region_Playing_default();
				player_MusicPlayer_inner_region_Composite_Playing_Paused_react(false);
			} else {
				did_transition = false;
			}
		}
		if (did_transition==false) {
			did_transition = player_MusicPlayer_inner_region_Composite_Playing_Paused_react(try_transition);
		}
		return did_transition;
	}
	
	private boolean playButton_Enabled_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (sCInterface.playPressed) {
				exitSequence_PlayButton_Enabled();
				enterSequence_PlayButton_Disabled_default();
			} else {
				did_transition = false;
			}
		}
		return did_transition;
	}
	
	private boolean playButton_Disabled_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if ((sCInterface.pausePressed || sCInterface.stopPressed)) {
				exitSequence_PlayButton_Disabled();
				enterSequence_PlayButton_Enabled_default();
			} else {
				did_transition = false;
			}
		}
		return did_transition;
	}
	
	private boolean pauseButton_Enabled_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if ((sCInterface.pausePressed || sCInterface.stopPressed)) {
				exitSequence_PauseButton_Enabled();
				enterSequence_PauseButton_Disabled_default();
			} else {
				did_transition = false;
			}
		}
		return did_transition;
	}
	
	private boolean pauseButton_Disabled_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (sCInterface.playPressed) {
				exitSequence_PauseButton_Disabled();
				enterSequence_PauseButton_Enabled_default();
			} else {
				did_transition = false;
			}
		}
		return did_transition;
	}
	
	private boolean stopButton_Enabled_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (sCInterface.stopPressed) {
				exitSequence_StopButton_Enabled();
				enterSequence_StopButton_Disabled_default();
				react();
			} else {
				did_transition = false;
			}
		}
		if (did_transition==false) {
			did_transition = react();
		}
		return did_transition;
	}
	
	private boolean stopButton_Disabled_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (sCInterface.playPressed) {
				exitSequence_StopButton_Disabled();
				enterSequence_StopButton_Enabled_default();
				react();
			} else {
				did_transition = false;
			}
		}
		if (did_transition==false) {
			did_transition = react();
		}
		return did_transition;
	}
	
}
