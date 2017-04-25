package DAO;

import entity.Album;
import entity.Singer;
import entity.Song;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import util.HibernateUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by congphuong on 19-Dec-16.
 */
public class ArtistDAO {

    public static List<Singer> getSingerByPage(int page) {
        int pageSize = 10;
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        List<Singer> singers = new ArrayList<>();
        try {
            session.getTransaction().begin();
            Criteria criteria = session.createCriteria(Singer.class);
            criteria.setFirstResult(pageSize * (page - 1));
            criteria.setMaxResults(pageSize);
            singers = criteria.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return singers;
    }
    public static long getPageCount() {
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        long count = 0;
        try {
            session.getTransaction().begin();
            Criteria criteriaCount = session.createCriteria(Singer.class);
            criteriaCount.setProjection(Projections.rowCount());
            count = (long) criteriaCount.uniqueResult();
            session.getTransaction().commit();
            if (count % 10 == 0) {
                count = count / 10;
            } else {
                count = count / 10 + 1;
            }
        } catch (Exception e) {
            session.getTransaction().rollback();
        }
        return count;
    }

    public static List<Song> getSongBySinger(String slug, int page) {
        int pageSize = 10;
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        List<Song> songs = new ArrayList<>();
        try {
            session.getTransaction().begin();
            Criteria criteria = session.createCriteria(Song.class);
            criteria.createAlias("singers", "singers").add(Restrictions.eq("singers.slugSinger", slug));
            criteria.setFirstResult(pageSize * (page - 1));
            criteria.setMaxResults(pageSize);
            songs = criteria.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return songs;
    }

    public static long getSongPageCount(String slug) {
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        long count = 0;
        try {
            session.getTransaction().begin();
            Criteria criteria = session.createCriteria(Song.class);
            criteria.createAlias("singers", "singers").add(Restrictions.eq("singers.slugSinger", slug));
            criteria.setProjection(Projections.rowCount());
            count = (long) criteria.uniqueResult();
            session.getTransaction().commit();
            if (count % 10 == 0) {
                count = count / 10;
            } else {
                count = count / 10 + 1;
            }
        } catch (Exception e) {
            session.getTransaction().rollback();
        }
        return count;
    }

    public static List<Album> getAlbumBySinger(String slug, int page) {
        int pageSize = 10;
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        List<Album> albums = new ArrayList<>();
        try {
            session.getTransaction().begin();
            Criteria criteria = session.createCriteria(Album.class);
            criteria.createAlias("singers", "singers").add(Restrictions.eq("singers.slugSinger", slug));
            criteria.setFirstResult(pageSize * (page - 1));
            criteria.setMaxResults(pageSize);
            albums = criteria.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return albums;
    }
    public static long getAlbumPageCount(String slug) {
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        long count = 0;
        try {
            session.getTransaction().begin();
            Criteria criteria = session.createCriteria(Album.class);
            criteria.createAlias("singers", "singers").add(Restrictions.eq("singers.slugSinger", slug));
            criteria.setProjection(Projections.rowCount());
            count = (long) criteria.uniqueResult();
            session.getTransaction().commit();
            if (count % 10 == 0) {
                count = count / 10;
            } else {
                count = count / 10 + 1;
            }
        } catch (Exception e) {
            session.getTransaction().rollback();
        }
        return count;
    }

    public static Singer getSingerBySlug(String slug) {
        Session session = HibernateUtils.getSessionFactory().getCurrentSession();
        Singer singer = null;
        try {
            session.getTransaction().begin();
            String hql = "from " + Singer.class.getName() + " e where e.slugSinger =:slug";
            Query query = session.createQuery(hql);
            query.setParameter("slug", slug);
            singer = (Singer) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        return singer;
    }

    public static List<Singer> getRandomSinger(){
        List<Singer> singers = new ArrayList<Singer>();

        Session session = HibernateUtils.getSessionFactory().getCurrentSession();

        try {
            session.getTransaction().begin();
            String hql = "from " + Singer.class.getName() + " e order by rand()";
            Query query = session.createQuery(hql);
            query.setMaxResults(7);
            singers = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        Collections.shuffle(singers);
        return singers;
    }


    public static void main(String[] args) {
        System.out.println(getRandomSinger().size());
    }

}
