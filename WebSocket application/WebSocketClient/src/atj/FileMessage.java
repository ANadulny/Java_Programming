package atj;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Optional;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.ButtonType;
import javafx.stage.FileChooser;
import javafx.stage.Stage;

public class FileMessage {
	private String filePath;
	private boolean isFirstFileByte;

	FileMessage() {
		filePath = null;
		isFirstFileByte = true;
	}

	public void fileReceived(ByteBuffer buff) {

		if (isFirstFileByte) {
			try {
				Alert alert = new Alert(AlertType.CONFIRMATION);
				alert.setTitle("Received file");
				alert.setHeaderText("Do you want to download file?");

				Optional<ButtonType> result = alert.showAndWait();
				if (result.get() == ButtonType.OK) {
					FileChooser chooser = new FileChooser();
					chooser.setTitle("Where you want to save file?");

					Stage stage = new Stage();
					File path = chooser.showSaveDialog(stage);

					if (path != null) 
						filePath = path.toString();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			isFirstFileByte = false;
		}

		if (filePath != null) {
			File file = new File(filePath);
			try {
				FileOutputStream ostream;
				FileChannel channel;

				ostream = new FileOutputStream(file, false);
				channel = ostream.getChannel();

				channel.write(buff);
				channel.close();
				ostream.close();

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
}