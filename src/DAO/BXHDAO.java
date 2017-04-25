package DAO;

import entity.Viewalbum;
import entity.Viewsong;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by congp on 11-Dec-16.
 */
public class BXHDAO {
    private SessionFactory factory;

    public BXHDAO() {
        factory = HibernateUtils.getSessionFactory();
    }

    public List<Viewsong> getTopSong(int mounth, int year, String country) {
        List<Viewsong> topSong = new ArrayList<>();
        Session session = factory.getCurrentSession();
        try {
            session.getTransaction().begin();
            String hql = "from " + Viewsong.class.getName() + " e where e.mounth =:mounth and e.years =:year and e.songByIdSong.country.country =:country order by e.viewcount desc";
            Query query = session.createQuery(hql);
            query.setParameter("mounth", mounth);
            query.setParameter("year", year);
            query.setParameter("country", country);
            query.setMaxResults(10);
            topSong = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return topSong;
    }

    public List<Viewalbum> getTopAlbum(int mounth, int year, String country) {
        List<Viewalbum> topSong = new ArrayList<>();
        Session session = factory.getCurrentSession();
        try {
            session.getTransaction().begin();
            String hql = "from " + Viewalbum.class.getName() + " e where e.mounth =:mounth and e.years =:year and e.albumByIdAlbum.country.country =:country order by e.viewcount desc";
            Query query = session.createQuery(hql);
            query.setParameter("mounth", mounth);
            query.setParameter("year", year);
            query.setParameter("country", country);
            query.setMaxResults(10);
            topSong = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return topSong;
    }

    /*public static void main(String[] args){
        BXHDAO viewSongDAO = new BXHDAO();
        System.out.println(viewSongDAO.getTopSong(12,2016).size());
        for (Viewsong vs: viewSongDAO.getTopSong(12,2016)
             ) {
            System.out.println(vs.getSongByIdSong().toString());
        }
    }*/
}
