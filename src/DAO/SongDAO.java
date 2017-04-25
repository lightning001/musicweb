package DAO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.StringTokenizer;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import entity.Album;
import entity.Song;
import util.HibernateUtils;

public class SongDAO {
	SessionFactory session;

	public SongDAO() {
		session = HibernateUtils.getSessionFactory();
	}

	public static Song getSongBySlug(String slug) {
		Song song;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Song.class.getName() + " e where e.slugSong=:slug";
			Query query = session.createQuery(hql);
			query.setParameter("slug", slug);
			song = (Song) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return null;
		}
		return song;
	}

	@SuppressWarnings("unchecked")
	public static List<Song> getSongByAlbum(Album album) {
		List<Song> songs = new ArrayList<Song>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Song.class.getName() + " e where e.album=:album order by e.idSong asc";
			Query query = session.createQuery(hql);
			query.setParameter("album", album);
			songs = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return songs;
	}

	@SuppressWarnings("unchecked")
	public static List<Song> getRandomSong() {
		List<Song> songs = new ArrayList<Song>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Song.class.getName() + " e order by rand()";
			Query query = session.createQuery(hql);
			query.setMaxResults(7);
			songs = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		Collections.shuffle(songs);
		return songs;
	}

	@SuppressWarnings("unchecked")
	public static List<Song> getAllSong() {
		List<Song> listSong = new ArrayList<Song>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Song.class.getName() + " e order by e.idSong desc";
			Query query = session.createQuery(hql);
			listSong = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return null;
		}
		return listSong;
	}

	public static Song getSong(int idSong) {
		Song song = null;
		for (Song s : getAllSong())
			if (s.getIdSong() == idSong)
				song = s;
		return song;
	}

	public static List<Song> createListSong(StringTokenizer st) {
		List<Song> list = new ArrayList<Song>();
		while (st.hasMoreTokens()) {
			Song s;
			if ((s = getSong(Integer.parseInt(st.nextToken()))) != null) {
				list.add(s);

			}
		}
		return list;
	}

	@SuppressWarnings({ "unused", "unchecked" })
	public static List<Song> pagingSong(int page, int pageSize) {
		List<Song> listSong = new ArrayList<Song>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Song.class.getName();
			Criteria criteria = session.createCriteria(Song.class);
			criteria.setFirstResult((page - 1) * pageSize);
			criteria.setMaxResults(pageSize);
			listSong = criteria.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return listSong;
	}

	public static long getPageCount() {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		long count = 0;
		try {
			session.getTransaction().begin();
			Criteria criteriaCount = session.createCriteria(Song.class);
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

	public static int getLastID() {
		int result = 0;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "select max(idSong) from " + Song.class.getName();
			Query query = session.createQuery(hql);
			result = (int) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return result;
	}

	public static boolean insert(Song song) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(song);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean delete(Song song) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.delete(song);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean update(Song song) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.update(song);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

}
