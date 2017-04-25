package entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 * Created by congp on 03-Jan-17.
 */
@Entity
public class Menu implements Serializable {
	private static final long serialVersionUID = 1L;
	private int menuId;
	private String name;
	private String path;
	private String icon;
	private int menuOrder;
	private List<Submenu> submenusByMenuId;
	private String type;

	public Menu() {
		// TODO Auto-generated constructor stub
	}
	

	public Menu(String type) {
		super();
		this.type = type;
	}


	public Menu(int menuId, String name, String path, String icon, int menuOrder, List<Submenu> submenusByMenuId,
			String type) {
		super();
		this.menuId = menuId;
		this.name = name;
		this.path = path;
		this.icon = icon;
		this.menuOrder = menuOrder;
		this.submenusByMenuId = submenusByMenuId;
		this.type = type;
	}

	@Id
	@Column(name = "menuID")
	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	@Basic
	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

		Menu menu = (Menu) o;

		if (menuId != menu.menuId)
			return false;
		if (menuOrder != menu.menuOrder)
			return false;
		if (name != null ? !name.equals(menu.name) : menu.name != null)
			return false;
		if (path != null ? !path.equals(menu.path) : menu.path != null)
			return false;
		if (icon != null ? !icon.equals(menu.icon) : menu.icon != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = menuId;
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (path != null ? path.hashCode() : 0);
		result = 31 * result + (icon != null ? icon.hashCode() : 0);
		result = 31 * result + menuOrder;
		return result;
	}

	@OneToMany(mappedBy = "menuByMenuId")
	public List<Submenu> getSubmenusByMenuId() {
		return submenusByMenuId;
	}

	public void setSubmenusByMenuId(List<Submenu> submenusByMenuId) {
		this.submenusByMenuId = submenusByMenuId;
	}

	@Basic
	@Column(name = "type")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
