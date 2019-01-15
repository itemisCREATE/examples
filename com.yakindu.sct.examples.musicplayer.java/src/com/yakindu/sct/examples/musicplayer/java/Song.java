package com.yakindu.sct.examples.musicplayer.java;

import java.io.File;
import java.net.URL;

public class Song {

	private File file;
	public String name;
	
	public Song(File file, String name) {
		this.file = file;
		this.name = name;
	}
	
	public static Song from(String fileName) {
		URL url = Song.class.getResource(fileName);
		File file = new File(url.getPath());
		Song song = new Song(file, fileName);
		return song;
	}

	public String getName() {
		return name;
	}

	public File getFile() {
		return file;
	}
}
