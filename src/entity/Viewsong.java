package entity;

import javax.persistence.*;

/**
 * Created by congp on 11-Dec-16.
 */
@Entity
@IdClass(ViewsongPK.class)
public class Viewsong {
    private int idSong;
    private int mounth;
    private int years;
    private Integer viewcount;
    private Song songByIdSong;

    @Id
    @Column(name = "idSong", nullable = false)
    public int getIdSong() {
        return idSong;
    }

    public void setIdSong(int idSong) {
        this.idSong = idSong;
    }

    @Id
    @Column(name = "mounth", nullable = false)
    public int getMounth() {
        return mounth;
    }

    public void setMounth(int mounth) {
        this.mounth = mounth;
    }

    @Id
    @Column(name = "years", nullable = false)
    public int getYears() {
        return years;
    }

    public void setYears(int years) {
        this.years = years;
    }

    @Basic
    @Column(name = "viewcount", nullable = true)
    public Integer getViewcount() {
        return viewcount;
    }

    public void setViewcount(Integer viewcount) {
        this.viewcount = viewcount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Viewsong viewsong = (Viewsong) o;

        if (idSong != viewsong.idSong) return false;
        if (mounth != viewsong.mounth) return false;
        if (years != viewsong.years) return false;
        if (viewcount != null ? !viewcount.equals(viewsong.viewcount) : viewsong.viewcount != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idSong;
        result = 31 * result + mounth;
        result = 31 * result + years;
        result = 31 * result + (viewcount != null ? viewcount.hashCode() : 0);
        return result;
    }

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name = "idSong", referencedColumnName = "idSong", nullable = false)
    public Song getSongByIdSong() {
        return songByIdSong;
    }

    public void setSongByIdSong(Song songByIdSong) {
        this.songByIdSong = songByIdSong;
    }
}
