package DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import entity.Album;
import entity.Singer;
import util.HibernateUtils;

public class AlbumDAO {

	@SuppressWarnings("unchecked")
	public static List<Album> getNewAlbum() {
		List<Album> albums = new ArrayList<Album>();

		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Album.class.getName() + " e order by e.idAlbum desc";
			Query query = session.createQuery(hql);
			query.setMaxResults(12);
			albums = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return albums;
	}

	@SuppressWarnings("unchecked")
	public static List<Album> getAllAlbum() {
		List<Album> albums = new ArrayList<Album>();

		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Album.class.getName() + " e order by e.idAlbum desc";
			Query query = session.createQuery(hql);
			// query.setMaxResults(12);
			albums = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return albums;
	}

	public static Album getAlbumBySlug(String slug) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		Album albums = new Album();
		try {
			session.getTransaction().begin();
			String hql = "from " + Album.class.getName() + " e where e.slugAlbum =:slugAlbum";
			Query query = session.createQuery(hql);
			query.setParameter("slugAlbum", slug);
			albums = (Album) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return albums;
	}

	@SuppressWarnings("unchecked")
	public static List<Album> getAlbumByCate(String cat, int page) {
		int pageSize = 10;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		List<Album> albums = new ArrayList<Album>();
		try {
			session.getTransaction().begin();
			Criteria criteria = session.createCriteria(Album.class);
			criteria.createAlias("category", "cat").add(Restrictions.eq("cat.category", cat));
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

	@SuppressWarnings("unchecked")
	public static List<Album> getAlbumByIdSinger(int idSinger) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		List<Album> albums = new ArrayList<Album>();
		try {
			session.getTransaction().begin();
			Criteria criteria = session.createCriteria(Album.class);
			criteria.createAlias("singer", "sg").add(Restrictions.eq("sg.idsinger", idSinger));
			criteria.setMaxResults(8);
			albums = criteria.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return albums;
	}

	@SuppressWarnings("unchecked")
	public static List<Album> getAlbumBySinger(Singer singer) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		List<Album> albums = new ArrayList<Album>();
		try {
			session.getTransaction().begin();
			String hql = "from " + Album.class.getName() + " e where e.singer =:singer";
			Query query = session.createQuery(hql);
			query.setParameter("singer", singer);
			query.setMaxResults(8);
			albums = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return albums;
	}

	public static long getPageCount() {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		long count = 0;
		try {
			session.getTransaction().begin();
			Criteria criteriaCount = session.createCriteria(Album.class);
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

	public static List<Album> pagingAlbum(int page, int pageSize) {

		List<Album> listAlbum = new ArrayList<Album>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Album.class.getName() + " e order by e.idAlbum asc";
			Query query = session.createQuery(hql);
			query.setFirstResult((page - 1) * pageSize);
			query.setMaxResults(pageSize);
			listAlbum = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return listAlbum;
	}

	public static boolean insert(Album album) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.save(album);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean delete(Album album) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.delete(album);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static Album getAlbumByID(int idAlbum) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		Album albums = null;
		try {
			session.getTransaction().begin();
			String hql = "from " + Album.class.getName() + " e where e.idAlbum =:idAlbum";
			Query query = session.createQuery(hql);
			query.setParameter("idAlbum", idAlbum);
			query.setMaxResults(1);
			albums = (Album) query.list().get(0);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return albums;
	}

	public static boolean update(Album album) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.update(album);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static int getLastID() {
		int result = 0;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "select max(idAlbum) from " + Album.class.getName();
			Query query = session.createQuery(hql);
			query.setMaxResults(1);
			result = (int) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return result;
	}

	public static long getCountRecord() {
		long result = 0;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = " select count(*) from " + Album.class.getName();
			Query query = session.createQuery(hql);
			query.setMaxResults(1);
			result = (long) query.list().get(0);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return result;
	}

	public static List<Album> createListAlbum(StringTokenizer st) {
		List<Album> list = new ArrayList<Album>();
		while (st.hasMoreTokens()) {
			Album al;
			try {
				if ((al = getSinger(Integer.parseInt(st.nextToken()))) != null)
					list.add(al);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public static Album getSinger(int idSinger) {
		Album album = null;
		List<Album> listAlbum = getAllAlbum();
		for (Album al : listAlbum) {
			if (idSinger == al.getIdAlbum()) {
				album = al;
				break;
			}
		}
		return album;
	}

	@SuppressWarnings("unchecked")
	public static List<Album> getAlbumByPage(int page) {
		int pageSize = 10;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		List<Album> albums = new ArrayList<Album>();
		try {
			session.getTransaction().begin();
			Criteria criteria = session.createCriteria(Album.class);
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

}
