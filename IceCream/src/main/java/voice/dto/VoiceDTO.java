package voice.dto;

public class VoiceDTO {
    private String id; // 작성자(아이디)
    private String content; // 내용
    private String title; // 제목
    private int num; // 글번호
    private String fileName; // 첨부파일
    private int voice_re_ref; // 관련 글번호
    private int voice_re_lev; // 답글 레벨
    private int voice_re_seq; // 관련글 중 출력 순서
    private String logTime; // 작성일

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getVoice_re_ref() {
        return voice_re_ref;
    }

    public void setVoice_re_ref(int voice_re_ref) {
        this.voice_re_ref = voice_re_ref;
    }

    public int getVoice_re_lev() {
        return voice_re_lev;
    }

    public void setVoice_re_lev(int voice_re_lev) {
        this.voice_re_lev = voice_re_lev;
    }

    public int getVoice_re_seq() {
        return voice_re_seq;
    }

    public void setVoice_re_seq(int voice_re_seq) {
        this.voice_re_seq = voice_re_seq;
    }

    public String getLogTime() {
        return logTime;
    }

    public void setLogTime(String logTime) {
        this.logTime = logTime;
    }

    @Override
    public String toString() {
        return "VoiceDTO{" +
                "id='" + id + '\'' +
                ", content='" + content + '\'' +
                ", title='" + title + '\'' +
                ", num=" + num +
                ", fileName='" + fileName + '\'' +
                ", voice_re_ref=" + voice_re_ref +
                ", voice_re_lev=" + voice_re_lev +
                ", voice_re_seq=" + voice_re_seq +
                ", logTime=" + logTime +
                '}';
    }
}
