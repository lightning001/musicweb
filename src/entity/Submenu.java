package entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 * Created by congp on 03-Jan-17.
 */
@Entity
public class Submenu implements Serializable {
	private static final long serialVersionUID = 1L;
	private int subMenuId;
	private String namemenu;
	private String path;
	private String icon;
	private int menuOrder;
	private Menu menuByMenuId;
	private List<Secondsubmenu> secondsubmenusBySubMenuId;

	public Submenu() {
		// TODO Auto-generated constructor stub
	}

	public Submenu(int subMenuId, String namemenu, String path, String icon, int menuOrder, Menu menuByMenuId,
			List<Secondsubmenu> secondsubmenusBySubMenuId) {
		super();
		this.subMenuId = subMenuId;
		this.namemenu = namemenu;
		this.path = path;
		this.icon = icon;
		this.menuOrder = menuOrder;
		this.menuByMenuId = menuByMenuId;
		this.secondsubmenusBySubMenuId = secondsubmenusBySubMenuId;
	}

	@Id
	@Column(name = "subMenuID")
	public int getSubMenuId() {
		return subMenuId;
	}

	public void setSubMenuId(int subMenuId) {
		this.subMenuId = subMenuId;
	}

	@Basic
	@Column(name = "namemenu")
	public String getNamemenu() {
		return namemenu;
	}

	public void setNamemenu(String namemenu) {
		this.namemenu = namemenu;
	}

	@Basic
	@Column(name = "path")
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Basic
	@Column(name = "icon")
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Basic
	@Column(name = "menuOrder")
	public int getMenuOrder() {
		return menuOrder;
	}

	public void setMenuOrder(int menuOrder) {
		this.menuOrder = menuOrder;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Submenu submenu = (Submenu) o;

		if (subMenuId != submenu.subMenuId)
			return false;
		if (menuOrder != submenu.menuOrder)
			return false;
		if (namemenu != null ? !namemenu.equals(submenu.namemenu) : submenu.namemenu != null)
			return false;
		if (path != null ? !path.equals(submenu.path) : submenu.path != null)
			return false;
		if (icon != null ? !icon.equals(submenu.icon) : submenu.icon != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = subMenuId;
		result = 31 * result + (namemenu != null ? namemenu.hashCode() : 0);
		result = 31 * result + (path != null ? path.hashCode() : 0);
		result = 31 * result + (icon != null ? icon.hashCode() : 0);
		result = 31 * result + menuOrder;
		return result;
	}

	@ManyToOne
	@JoinColumn(name = "menuID", referencedColumnName = "menuID", nullable = false)
	public Menu getMenuByMenuId() {
		return menuByMenuId;
	}

	public void setMenuByMenuId(Menu menuByMenuId) {
		this.menuByMenuId = menuByMenuId;
	}

	@OneToMany(mappedBy = "submenuBySubMenuId")
	public List<Secondsubmenu> getSecondsubmenusBySubMenuId() {
		return secondsubmenusBySubMenuId;
	}

	public void setSecondsubmenusBySubMenuId(List<Secondsubmenu> secondsubmenusBySubMenuId) {
		this.secondsubmenusBySubMenuId = secondsubmenusBySubMenuId;
	}
}
