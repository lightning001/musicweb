package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import entity.Album;
import entity.Song;
import entity.Users;
import util.HibernateUtils;

public class UserDAO {

	/**
	 * Data for user page
	 */

	public static Users dangNhap(String userName, String passwd) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Users.class.getName() + " e where e.userName =:userName and e.passwd =:passwd";
			Query query = session.createQuery(hql);
			query.setParameter("userName", userName);
			query.setParameter("passwd", passwd);
			Users user = (Users) query.uniqueResult();
			session.getTransaction().commit();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return null;
		}
	}

	public static Users register(String username, String password) {
		Users user = null;

		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			user = new Users();
			user.setUserName(username);
			user.setPasswd(password);
			session.save(user);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return null;
		}
		return user;

	}

	@SuppressWarnings("unchecked")
	public static List<Song> getSongByUser(int idUser, int page) {
		int pageSize = 10;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		List<Song> songs = new ArrayList<>();
		try {
			session.getTransaction().begin();
			Criteria criteria = session.createCriteria(Song.class);
			criteria.createAlias("userses", "userses").add(Restrictions.eq("userses.idUser", idUser));
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

	public static long getSongPageCount(int idUser) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		long count = 0;
		try {
			session.getTransaction().begin();
			Criteria criteria = session.createCriteria(Song.class);
			criteria.createAlias("userses", "userses").add(Restrictions.eq("userses.idUser", idUser));
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

	@SuppressWarnings("unchecked")
	public static List<Album> getAlbumByUser(int idUser, int page) {
		int pageSize = 10;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		List<Album> albums = new ArrayList<>();
		try {
			session.getTransaction().begin();
			Criteria criteria = session.createCriteria(Album.class);
			criteria.createAlias("userses", "userses").add(Restrictions.eq("userses.idUser", idUser));
			criteria.setFirstResult(pageSize * (page - 1) + 1);
			criteria.setMaxResults(pageSize);
			albums = criteria.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return albums;
	}

	public static long getAlbumPageCount(int idUser) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		long count = 0;
		try {
			session.getTransaction().begin();
			Criteria criteria = session.createCriteria(Album.class);
			criteria.createAlias("userses", "userses").add(Restrictions.eq("userses.idUser", idUser));
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

	/**
	 * Data for admin page
	 * 
	 */

	@SuppressWarnings("unchecked")
	public static List<Users> getAllUsers() {
		List<Users> listUser = new ArrayList<Users>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Users.class.getName() + " e where e.isAdmin = 'USER' order by e.idUser asc";
			Query query = session.createQuery(hql);
			listUser = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return null;
		}
		return listUser;
	}

	@SuppressWarnings("unchecked")
	public static List<Users> getListAdmin(String chucvu) {
		List<Users> listUser = new ArrayList<Users>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Users.class.getName() + " e where e.isAdmin =:chucvu order by e.idUser desc";
			Query query = session.createQuery(hql);
			listUser = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return null;
		}
		return listUser;
	}

	@SuppressWarnings("unchecked")
	public static List<Users> getListAdmin() {
		List<Users> listUser = new ArrayList<Users>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Users.class.getName()
					+ " e where e.isAdmin = 'Mod' or e.isAdmin = 'Leader' order by e.idUser asc";
			Query query = session.createQuery(hql);
			listUser = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return null;
		}
		return listUser;
	}

	public static Users getAdminByEmailAndPass(String email, String passwd) {
		Users u = null;
		if (email != null && !"".equals(email) && passwd != null && !"".equals(passwd))
			for (Users user : getListAdmin()) {
				if (email.equals(user.getEmail()) && passwd.equals(user.getPasswd())
						&& ("Leader".equalsIgnoreCase(user.getIsAdmin()) || "Mod".equalsIgnoreCase(user.getIsAdmin())))
					u = user;
			}
		return u;
	}

	public static long getCountRecord() {
		long result = 0;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = " select count(*) from " + Users.class.getName();
			Query query = session.createQuery(hql);
			query.setMaxResults(1);
			result = (long) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return result;
	}

	public static Users getAdminById(int id) {
		List<Users> list = getListAdmin();
		if (list != null && !list.isEmpty())
			for (Users user : list) {
				if (user.getIdUser() == id)
					return user;
			}
		return null;
	}

	@SuppressWarnings({ "unchecked" })
	public List<Users> pagingUser(int page, int pageSize) {

		List<Users> listusers = new ArrayList<Users>();
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "from " + Users.class.getName() + " e where e.isAdmin='User' order by e.idUser asc";
			Query query = session.createQuery(hql);
			query.setFirstResult((page - 1) * pageSize);
			query.setMaxResults(pageSize);
			listusers = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return listusers;
	}

	public static long numPageUser(int page, int pageSize) {
		long result = 0;
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "select count(*) from " + Users.class.getName() + " e where e.isAdmin='User'";
			Query query = session.createQuery(hql);
			query.setMaxResults(1);
			result = (Long) query.uniqueResult();
			if (result % pageSize == 0)
				result = result % pageSize;
			else
				result = result % pageSize + 1;
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return result;
	}

	public static void main(String[] args) {
		UserDAO u = new UserDAO();
		System.out.println(getUserByID(4));
	}

	public static boolean insert(Users user) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.save(user);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean update(Users user) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.update(user);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static boolean delete(Users user) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		try {
			session.beginTransaction();
			session.delete(user);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return false;
		}
	}

	public static Users getUserByID(int id) {
		Users user = null;

		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Users.class.getName() + " e where idUser=:idUser and isAdmin='user'";
			Query query = session.createQuery(hql);
			query.setParameter("idUser", id);
			query.setMaxResults(1);
			user = (Users) query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			return null;
		}
		return user;

	}
}
