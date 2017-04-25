package entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by congp on 30-Dec-16.
 */
public class LikeSongPK implements Serializable {
    private int idUser;
    private int idSong;

    @Column(name = "idUser")
    @Id
    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    @Column(name = "idSong")
    @Id
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

        LikeSongPK that = (LikeSongPK) o;

        if (idUser != that.idUser) return false;
        if (idSong != that.idSong) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idUser;
        result = 31 * result + idSong;
        return result;
    }
}
