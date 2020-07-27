package com.yakindu.sct.examples.musicplayer.java;


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
		IPlayer statemachine = new Player();
		
		statemachine.init();
		
		// hook up in-events
		playBtn.setOnAction((e) -> {
			statemachine.getInterface().raisePlayPressed();
		});
		
		pauseBtn.setOnAction((e) -> {
			statemachine.getInterface().raisePausePressed();
		});
		
		stopBtn.setOnAction((e) -> {
			statemachine.getInterface().raiseStopPressed();
		});
		
		prevBtn.setOnAction((e) -> {
			statemachine.getInterface().raisePrevPressed();
			infoLbl.setText(statemachine.getInterface().getCurrentSong().getName());
		});
		
		nextBtn.setOnAction((e) -> {
			statemachine.getInterface().raiseNextPressed();
			infoLbl.setText(statemachine.getInterface().getCurrentSong().getName());
		});

		// hook up out-events
		statemachine.getInterface().getPlayBtnEnabled().subscribe(value -> playBtn.setDisable(!value));
		statemachine.getInterface().getPauseBtnEnabled().subscribe(value -> pauseBtn.setDisable(!value));
		statemachine.getInterface().getStopBtnEnabled().subscribe(value -> stopBtn.setDisable(!value));
		
		statemachine.enter();
		
		infoLbl.setText(statemachine.getInterface().getCurrentSong().getName());
	}

}
