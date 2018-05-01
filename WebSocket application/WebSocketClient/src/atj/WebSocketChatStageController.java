package atj;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.nio.ByteBuffer;

import javax.websocket.ClientEndpoint;
import javax.websocket.CloseReason;
import javax.websocket.ContainerProvider;
import javax.websocket.DeploymentException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.WebSocketContainer;

import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.stage.FileChooser;
import javafx.stage.Stage;

public class WebSocketChatStageController {

	@FXML TextField userTextField;
	@FXML TextArea chatTextArea;
	@FXML TextArea userNameArea;
	@FXML TextArea fileField;
	@FXML TextField messageTextField;
	@FXML Button btnSet;
	@FXML Button btnSend;
	@FXML Button btnSelectFile;
	@FXML Button btnSendFile;
	@FXML Button btnDeleteFile;

	private String user;
	private WebSocketClient webSocketClient;
	private File file;

	private static final int BUFFER_SIZE = 4 * 1024 * 1024; // 4MB

	@FXML private void initialize() {
		System.out.println("init");

		webSocketClient = new WebSocketClient();
		user = userTextField.getText();

		file = null;

		btnSelectFile.setDisable(true);
		btnSend.setDisable(true);
	}

	@FXML private void btnSet_Click() {
		if (userTextField.getText().isEmpty()) {
			return;
		}
		user = userTextField.getText();
		userTextField.clear();
		userNameArea.clear();
		userNameArea.setText(user);

		btnSelectFile.setDisable(false);
		btnSend.setDisable(false);
	}

	@FXML private void TextField_KeyPressed(KeyEvent e) {
		if (e.getCode() == KeyCode.ENTER) {
			btnSend_Click();
		}
	}

	@FXML private void btnSend_Click() {
		if (messageTextField.getText().isEmpty()) {
			return;
		}

		webSocketClient.sendMessage(messageTextField.getText());
		messageTextField.clear();
	}

	@FXML private void btnSelectFile_Click() {
		Stage stage = new Stage();
		FileChooser chooser = new FileChooser();
		chooser.setTitle("Choose the attachment");
		file = chooser.showOpenDialog(stage);
		if (file != null) {
			fileField.setText("[FILE] Attached: \n" + file.getName());
			btnSendFile.setDisable(false);
			btnDeleteFile.setDisable(false);
		}
	}

	@FXML private void btnUploadFile_Click() {
		webSocketClient.sendFileMessage();
		webSocketClient.sendMessage(fileField.getText());
		fileField.clear();
		btnSendFile.setDisable(true);
		btnDeleteFile.setDisable(true);
	}

	@FXML private void btnDeleteFile_Click() {
		fileField.clear();
		file = null;
		btnSendFile.setDisable(true);
		btnDeleteFile.setDisable(true);
	}

	public void closeSession(CloseReason closeReason) {
		try {
			webSocketClient.session.close(closeReason);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@ClientEndpoint
	public class WebSocketClient {
		private Session session;

		public WebSocketClient() {
			connectToWebSocket();
		}

		@OnOpen
		public void onOpen(Session session) {
			System.out.println("Connection onOpen");
			this.session = session;

		}

		@OnClose
		public void onClose(CloseReason closeReason) {
			System.out.println("Connection onClose: " + closeReason.getReasonPhrase());
		}

		@OnError
		public void onError(Throwable throwable) {
			System.out.println("Error onError");
		}

		@OnMessage
		public void onMessage(String message, Session session) {
			System.out.println("Message received.");
			chatTextArea.setText(chatTextArea.getText() + message + "\n");
		}

		@OnMessage
		public void onMessage(ByteBuffer stream, Session session) {
			System.out.println("File received.");

			try {
				FileMessage fileMessage;
				fileMessage = new FileMessage();
				Platform.runLater(() -> fileMessage.fileReceived(stream));

			} catch (Throwable ex) {
				System.out.println("File error");
				ex.printStackTrace();
			}

		}

		private void connectToWebSocket() {
			WebSocketContainer webSocketContainer = ContainerProvider.getWebSocketContainer();
			try {
				// Another server is using the port 8080 in my computer so I use different port
				// number
				// URI uri = URI.create("ws://localhost:8080/Server/websocketendpoint");
				URI uri = URI.create("ws://localhost:9090/Server/websocketendpoint");
				webSocketContainer.connectToServer(this, uri);
			} catch (DeploymentException | IOException e) {
				e.printStackTrace();
			}
		}

		public void sendMessage(String message) {
			try {
				System.out.println("User sent the message: " + message);
				session.getBasicRemote().sendText(user + ": " + message);
			} catch (IOException ex) {
				ex.printStackTrace();
			}

		}

		public void sendFileMessage() {
			if ((int) file.length() > BUFFER_SIZE) {
				Alert alert = new Alert(AlertType.ERROR);
				alert.setTitle("Wrong file size");
				alert.setHeaderText("File can not be send");
				alert.showAndWait();
				file = null;
				return;
			}

			int allParts = (int) (file.length());
			try {
				ByteBuffer buf = ByteBuffer.allocateDirect(allParts);
				InputStream input = new FileInputStream(file);

				int read;
				while ((read = input.read()) != -1) {
					buf.put((byte) read);
				}

				input.close();
				buf.flip();
				session.getBasicRemote().sendBinary(buf);
				buf.clear();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
			file = null;
		}

	}// WebSocketClient
}// WebSocketChatStageController
