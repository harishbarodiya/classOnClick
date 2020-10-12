package dto;

/**
 *
 * @author harish
 */
public class FetchLinkDto {
    private String date;
    private String period;
    private String course;
    private String teacher;
    private String link;

    public FetchLinkDto() {
    }

    public FetchLinkDto(String date, String period, String course, String teacher, String link) {
        this.date = date;
        this.period = period;
        this.course = course;
        this.teacher = teacher;
        this.link = link;
    }

    
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
    
}
