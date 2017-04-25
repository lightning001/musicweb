package entity;

import javax.persistence.*;

/**
 * Created by congp on 30-Dec-16.
 */
@Entity
@Table(name = "like_song", schema = "musicweb", catalog = "")
@IdClass(LikeSongPK.class)
public class LikeSong {
    private int idUser;
    private int idSong;

    @Id
    @Column(name = "idUser")
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    @Id
    @Column(name = "idSong")
    public int getIdSong() {
        return idSong;
    }

    public void setIdSong(int idSong) {
        this.idSong = idSong;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LikeSong likeSong = (LikeSong) o;

        if (idUser != likeSong.idUser) return false;
        if (idSong != likeSong.idSong) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idUser;
        result = 31 * result + idSong;
        return result;
    }
}
