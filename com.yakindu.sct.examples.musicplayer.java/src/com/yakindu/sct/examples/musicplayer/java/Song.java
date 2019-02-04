package com.yakindu.sct.examples.musicplayer.java;

import java.io.File;
import java.net.URL;

public class Song {

	public String filename;
	
	public Song(String filename) {
		this.filename = filename;
	}

	public String getName() {
		return filename;
	}

	public File getFile() {
		URL url = Song.class.getResource(filename);
		return new File(url.getPath());
	}
}
