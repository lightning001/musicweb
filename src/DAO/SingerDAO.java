package DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

import entity.Singer;
import util.HibernateUtils;

public class SingerDAO {

	@SuppressWarnings("unchecked")
	public static List<Singer> getNewSinger() {
		List<Singer> singers = new ArrayList<Singer>();

		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Singer.class.getName() + " e order by e.idSinger desc";
			Query query = session.createQuery(hql);
			query.setMaxResults(9);
			singers = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return singers;
	}

	@SuppressWarnings("unchecked")
	public static List<Singer> getAllSinger() {
		List<Singer> singers = new ArrayList<Singer>();

		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Singer.class.getName() + " e order by e.idSinger desc";
			Query query = session.createQuery(hql);
			singers = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return singers;
	}

	public static Singer getSingerBySlug(String slug) {
		Singer singer = null;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Singer.class.getName() + " e where e.slugSinger=:slug";
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

	public static Singer getSinger(int idSinger) {
		Singer singer = null;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Singer.class.getName() + " e where e.idSinger=:idSinger";
			Query query = session.createQuery(hql);
			query.setParameter("idSinger", idSinger);
			singer = (Singer) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return singer;
	}

	public static List<Singer> createListSinger(StringTokenizer st) {
		List<Singer> list = new ArrayList<Singer>();
		while (st.hasMoreTokens()) {
			Singer s;
			try {
				if ((s = getSinger(Integer.parseInt(st.nextToken()))) != null) {
					list.add(s);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@SuppressWarnings({ "unused", "unchecked" })
	public static List<Singer> pagingSinger(int page, int pageSize) {

		List<Singer> listSong = new ArrayList<Singer>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Singer.class.getName();
			Criteria criteria = session.createCriteria(Singer.class);
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

	public static boolean insert(Singer singer) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.save(singer);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean delete(Singer singer) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.delete(singer);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean update(Singer singer) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.update(singer);
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
			String hql = "select max(idSinger) from " + Singer.class.getName();
			Query query = session.createQuery(hql);
			result = (int) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return result;
	}

}
