package event.dto;

public class EventDTO {
	private int num;
	private String title;
	private String content;
	private int hit;
	private String logTime;
	private String fileName;

	@Override
	public String toString() {
		return "EventDTO [num=" + num + ", title=" + title + ", content=" + content + ", hit=" + hit + ", logTime="
				+ logTime + ", fileName=" + fileName + "]";
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getLogTime() {
		return logTime;
	}

	public void setLogTime(String logTime) {
		this.logTime = logTime;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
