package com.wdata.system.model;


import java.util.List;

/**  
 * @Title: Menu
 * @ProjectName wdata
 * @Description: TODO
 * @author 青锋
 * @date 2018-8-28 22:51
 */
public class Menu {
	
	private String menu_id;
	private String menu_name;
	private String menu_url;
	private String parent_id;
	private String menu_order;
	private String menu_icon;
	private String target;
	private String role_id;
	
	private Menu parentMenu;
	private List<Menu> subMenu;
	
	private boolean isCheck = false;
	private boolean hasMenu = false;
	public String getMenu_id() {
		return menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public String getMenu_url() {
		return menu_url;
	}
	public String getParent_id() {
		return parent_id;
	}
	public String getMenu_order() {
		return menu_order;
	}
	public String getMenu_icon() {
		return menu_icon;
	}
	public void setMenu_id(String menuId) {
		menu_id = menuId;
	}
	public void setMenu_name(String menuName) {
		menu_name = menuName;
	}
	public void setMenu_url(String menuUrl) {
		menu_url = menuUrl;
	}
	public void setParent_id(String parentId) {
		parent_id = parentId;
	}
	public void setMenu_order(String menuOrder) {
		menu_order = menuOrder;
	}
	public void setMenu_icon(String menuIcon) {
		menu_icon = menuIcon;
	}
	public Menu getParentMenu() {
		return parentMenu;
	}
	public void setParentMenu(Menu parentMenu) {
		this.parentMenu = parentMenu;
	}
	public List<Menu> getSubMenu() {
		return subMenu;
	}
	public void setSubMenu(List<Menu> subMenu) {
		this.subMenu = subMenu;
	}
	public boolean isHasMenu() {
		return hasMenu;
	}
	public void setHasMenu(boolean hasMenu) {
		this.hasMenu = hasMenu;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String roleId) {
		role_id = roleId;
	}
	public boolean isCheck() {
		return isCheck;
	}
	public void setCheck(boolean isCheck) {
		this.isCheck = isCheck;
	}

	
}
	
