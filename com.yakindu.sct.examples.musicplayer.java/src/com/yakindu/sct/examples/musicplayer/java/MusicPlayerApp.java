package com.yakindu.sct.examples.musicplayer.java;

import com.yakindu.sct.examples.musicplayer.java.player.IPlayerStatemachine;
import com.yakindu.sct.examples.musicplayer.java.player.IPlayerStatemachine.SCInterfaceListener;
import com.yakindu.sct.examples.musicplayer.java.player.PlayerStatemachine;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class MusicPlayerApp extends Application {

	private Button playBtn;
	private Button pauseBtn;
	private Button stopBtn;
	private Button prevBtn;
	private Button nextBtn;
	private Label infoLbl;

	public static void main(String[] args) {
		launch(args);
	}

	@Override
	public void start(Stage stage) throws Exception {
		GridPane grid = new GridPane();
		grid.setAlignment(Pos.CENTER);

		grid.setHgap(10);
		grid.setVgap(10);
		grid.setPadding(new Insets(25, 25, 25, 25));

		playBtn = new Button("Play");
		pauseBtn = new Button("Pause");
		stopBtn = new Button("Stop");
		prevBtn = new Button("Prev");
		nextBtn = new Button("Next");

		infoLbl = new Label("");

		grid.add(playBtn, 0, 0);
		grid.add(pauseBtn, 1, 0);
		grid.add(stopBtn, 2, 0);
		grid.add(prevBtn, 3, 0);
		grid.add(nextBtn, 4, 0);
		grid.add(infoLbl, 0, 1, 5, 1);

		Scene scene = new Scene(grid, 400, 100);
		stage.setTitle("Music Player");
		stage.setScene(scene);

		setupBehaviour();

		stage.show();
	}

	private void setupBehaviour() {
		IPlayerStatemachine statemachine = new PlayerStatemachine();
		
		statemachine.init();
		
		// hook up in-events
		playBtn.setOnAction((e) -> {
			statemachine.getSCInterface().raisePlayPressed();
		});
		
		pauseBtn.setOnAction((e) -> {
			statemachine.getSCInterface().raisePausePressed();
		});
		
		stopBtn.setOnAction((e) -> {
			statemachine.getSCInterface().raiseStopPressed();
		});
		
		prevBtn.setOnAction((e) -> {
			statemachine.getSCInterface().raisePrevPressed();
			infoLbl.setText(statemachine.getSCInterface().getCurrentSong().getName());
		});
		
		nextBtn.setOnAction((e) -> {
			statemachine.getSCInterface().raiseNextPressed();
			infoLbl.setText(statemachine.getSCInterface().getCurrentSong().getName());
		});

		// hook up out-events
		statemachine.getSCInterface().getListeners().add(new SCInterfaceListener() {

			@Override
			public void onPlayBtnEnabledRaised(boolean value) {
				playBtn.setDisable(!value);
			}

			@Override
			public void onPauseBtnEnabledRaised(boolean value) {
				pauseBtn.setDisable(!value);
			}

			@Override
			public void onStopBtnEnabledRaised(boolean value) {
				stopBtn.setDisable(!value);
			}
			
		});
		
		statemachine.enter();
		
		infoLbl.setText(statemachine.getSCInterface().getCurrentSong().getName());
	}

}
