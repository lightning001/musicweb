package DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import entity.Menu;
import entity.Secondsubmenu;
import entity.Submenu;
import util.HibernateUtils;

public class MenuDAO {
	public static void main(String[] args) {
		try {
			for (Menu m : getUserMenu()) {
				System.out.println(m.getName());
				if (m.getSubmenusByMenuId() != null && !m.getSubmenusByMenuId().isEmpty()) {
					for (Submenu sm : m.getSubmenusByMenuId()) {
						if (sm.getSecondsubmenusBySubMenuId() != null && !sm.getSecondsubmenusBySubMenuId().isEmpty()) {
							System.out.println(" " + sm.getNamemenu());
							for (Secondsubmenu sss : sm.getSecondsubmenusBySubMenuId()) {
								System.out.println(" " + sss.getName());
							}
						}
					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static List<Menu> getAdminMenu() {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		List<Menu> menus = new ArrayList<>();
		try {
			session.getTransaction().begin();
			String hql = "from " + Menu.class.getName() + " e where e.type=:type";
			Query query = session.createQuery(hql);
			String type = "admin";
			query.setParameter("type", type);
			menus = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return menus;
	}

	public static List<Menu> getUserMenu() {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		List<Menu> menus = null;
		try {
			session.getTransaction().begin();
			String hql = "from " + Menu.class.getName() + " e where e.type='user'";
			Query query = session.createQuery(hql);
			menus = query.list();
			session.getTransaction().commit();
			return menus;
		} catch (Exception e) {
			return null;
		}
	}

	public static List<Submenu> getAdminSubMenu() {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		List<Submenu> menus = null;
		try {
			session.getTransaction().begin();
			String hql = "from " + Submenu.class.getName();
			Query query = session.createQuery(hql);
			menus = query.list();
			session.getTransaction().commit();
			return menus;
		} catch (Exception e) {
			return null;
		}
	}

	public static List<Secondsubmenu> getAdminSecondSubMenu() {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		List<Secondsubmenu> menus = null;
		try {
			session.getTransaction().begin();
			String hql = "from " + Secondsubmenu.class.getName();
			Query query = session.createQuery(hql);
			menus = query.list();
			session.getTransaction().commit();
			return menus;
		} catch (Exception e) {
			return null;
		}
	}

	public static boolean insertMenu(Menu m) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(m);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean insertSubMenu(Submenu m) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(m);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean insertSecondSubMenu(Secondsubmenu m) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(m);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean updateMenu(Menu m) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			session.update(m);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean updateSubMenu(Submenu m) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			session.update(m);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean updateSecondSubMenu(Secondsubmenu m) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			session.update(m);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean deleteListMenu(List<Menu> m) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			for (Menu menu : m)
				session.delete(menu);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean deleteMenu(Menu m) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			session.delete(m);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean deleteSubMenu(Submenu m) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			session.delete(m);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean deleteListSubMenu(List<Submenu> m) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			for (Submenu sm : m)
				session.delete(sm);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean deleteSecondSubMenu(Secondsubmenu m) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			session.delete(m);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean deleteListSecondSubMenu(List<Secondsubmenu> m) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			for (Secondsubmenu ssm : m)
				session.delete(ssm);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static Menu getMenuByID(int menuId) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Menu.class.getName() + " e where e.menuId=:menuId";
			Query query = session.createQuery(hql);
			query.setParameter("menuId", menuId);
			query.setMaxResults(1);
			Menu menu = (Menu) query.uniqueResult();
			session.getTransaction().commit();
			return menu;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static Submenu getSubMenuByID(int menuId) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Submenu.class.getName() + " e where e.subMenuId=:subMenuId";
			Query query = session.createQuery(hql);
			query.setParameter("subMenuId", menuId);
			Submenu menu = (Submenu) query.uniqueResult();
			session.getTransaction().commit();
			return menu;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static Secondsubmenu getSecondSubMenuByID(int menuId) {
		Session session = HibernateUtils.getSessionFactory().getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "from " + Secondsubmenu.class.getName() + " e where e.id=:id";
			Query query = session.createQuery(hql);
			query.setParameter("id", menuId);
			Secondsubmenu menu = (Secondsubmenu) query.uniqueResult();
			session.getTransaction().commit();
			return menu;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
