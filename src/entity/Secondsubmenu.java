package entity;

import java.io.Serializable;

import javax.persistence.*;

/**
 * Created by congp on 03-Jan-17.
 */
@Entity
public class Secondsubmenu implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
    private String name;
    private String path;
    private String icon;
    private int menuOrder;
    private Submenu submenuBySubMenuId;

    public Secondsubmenu() {
		// TODO Auto-generated constructor stub
	}
	public Secondsubmenu(int id, String name, String path, String icon, int menuOrder, Submenu submenuBySubMenuId) {
		super();
		this.id = id;
		this.name = name;
		this.path = path;
		this.icon = icon;
		this.menuOrder = menuOrder;
		this.submenuBySubMenuId = submenuBySubMenuId;
	}

	@Id
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Secondsubmenu that = (Secondsubmenu) o;

        if (id != that.id) return false;
        if (menuOrder != that.menuOrder) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (path != null ? !path.equals(that.path) : that.path != null) return false;
        if (icon != null ? !icon.equals(that.icon) : that.icon != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (path != null ? path.hashCode() : 0);
        result = 31 * result + (icon != null ? icon.hashCode() : 0);
        result = 31 * result + menuOrder;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "subMenuID", referencedColumnName = "subMenuID", nullable = false)
    public Submenu getSubmenuBySubMenuId() {
        return submenuBySubMenuId;
    }

    public void setSubmenuBySubMenuId(Submenu submenuBySubMenuId) {
        this.submenuBySubMenuId = submenuBySubMenuId;
    }
}
