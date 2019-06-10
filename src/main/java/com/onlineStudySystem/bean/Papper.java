package com.onlineStudySystem.bean;

import com.onlineStudySystem.bean.ValidationGroup.SearchPapperGroup;
import com.onlineStudySystem.bean.ValidationGroup.SubmitPapperGroup;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Size;
import java.util.Date;

/**
 * 文章类
 */
public class Papper {

    //文章编号（唯一标志符）
    private String papperId;
    //文章主题
    @NotBlank(message = "文章标题不得为空！",groups = {SubmitPapperGroup.class, SearchPapperGroup.class})
    private String title;
    //文章内容
    @NotBlank(message = "文章内容不得为空！",groups = {SubmitPapperGroup.class})
    private String papperText;
    //文章简介
    @Size(max=50,message = "文章简介必须保持在50字以内！",groups = {SubmitPapperGroup.class})
    private String papperProfile;
    //文章类型
    @NotBlank(message = "请选择文章分类！",groups = {SubmitPapperGroup.class})
    private String type;
    //发布作者
    private UserInfo author;
    //发布人的id
    @NotBlank(message = "发布人id不得为空！")
    private String authorId;
    //发布日期
    private Date submitDate;
    //被读者收藏数量
    private int enshrineNumber;

    public String getPapperId() {
        return papperId;
    }

    public void setPapperId(String papperId) {
        this.papperId = papperId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    //    @Lob
//    @Basic(fetch=FetchType.LAZY)
//    @Column(columnDefinition="TEXT",nullable=true)
    public String getPapperText() {
        return papperText;
    }

    public void setPapperText(String papperText) {
        this.papperText = papperText;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public UserInfo getAuthor() {
        return author;
    }

    public void setAuthor(UserInfo author) {
        this.author = author;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public Date getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }

    public int getEnshrineNumber() {
        return enshrineNumber;
    }

    public void setEnshrineNumber(int enshrineNumber) {
        this.enshrineNumber = enshrineNumber;
    }


    public String getPapperProfile() {
        return papperProfile;
    }

    public void setPapperProfile(String papperProfile) {
        this.papperProfile = papperProfile;
    }

    @Override
    public String toString() {
        return "Papper{" +
                "papperId='" + papperId + '\'' +
                ", title='" + title + '\'' +
                ", papperText='" + papperText + '\'' +
                ", papperProfile='" + papperProfile + '\'' +
                ", type='" + type + '\'' +
                ", author=" + author +
                ", authorId='" + authorId + '\'' +
                ", submitDate=" + submitDate +
                ", enshrineNumber=" + enshrineNumber +
                '}';
    }
}

