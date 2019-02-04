package com.yakindu.sct.examples.musicplayer.java;

import java.io.IOException;

import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;

public class MusicPlayer {
	
	private Clip clip;

	public void play(Song song) {
		try {
			AudioInputStream audioInput = AudioSystem.getAudioInputStream(song.getFile());
			clip = AudioSystem.getClip();
			clip.open(audioInput);
			clip.start();
		} catch (UnsupportedAudioFileException | IOException | LineUnavailableException e) {
			e.printStackTrace();
		}
	}
	
	public void resume() {
		if (clip != null) {
			clip.start();
		}
	}
	
	public void pause() {
		if (clip != null) {
			clip.stop();
		}
	}
	
	public void stop() {
		if (clip != null) {
			clip.stop();
		}
	}
}
