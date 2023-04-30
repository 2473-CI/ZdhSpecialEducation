package szitu.springboot.model;

import lombok.Data;

@Data
public class File {
    private String fileType;
    private String contextType;
    private String fileTitle;
    private String fileSubtitle;
    private String filePath;
    private String fileOnwerId;
    private String OnwerType;
    private String publiced;
}
