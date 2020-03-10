package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pojo.Books;
import com.service.IBookService;
import com.service.IDateRecordService;
@SessionAttributes({"page","pageNum"})
@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private IBookService bookService;
	@Autowired
	private IDateRecordService dateRecordService;
	/**
	 * 查询所有图书
	 * @param model
	 * @return
	 */
	@RequestMapping("/allBooks")
	public String allBooks(Model model,Integer page) {
		List<Books> books=bookService.selectBooks(page);
		Integer pageNum=(int) Math.ceil(bookService.pageCount()/5.0);
		model.addAttribute("books",books);
		model.addAttribute("page",page);
		model.addAttribute("pageNum",pageNum);
		return "allBooks";
	}
	@RequestMapping("/reader_allBooks")
	public String reader_queryBook(Model model,Integer page) {
		List<Books> books=bookService.selectBooks(page);
		Integer pageNum=(int) Math.ceil(bookService.pageCount()/5.0);
		model.addAttribute("books",books);
		model.addAttribute("page",page);
		model.addAttribute("pageNum",pageNum);
		return "reader_allBooks";
	}
	/**
	 * 跳转到添加图书页面
	 * @return
	 */
	@RequestMapping("/addBooks")
	public String addBooks() {
		return "addBooks";
	}
	/**
	 * 添加图书
	 * @param books
	 * @return
	 */
	@RequestMapping("/insert")
	public String insert(Books books) {
		bookService.insert(books);
		return "redirect:/book/allBooks";
	}
	/**
	 * 根据id查询图书详情
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/details")
	public String selectOne(Integer id,Model model) {
		Books books=bookService.selectOne(id);
		model.addAttribute("details",books);
		return "details";
	}
	@RequestMapping("/queryOne")
	public String queryOne(Integer id,Model model) {
		Books books=bookService.selectOne(id);
		model.addAttribute("details",books);
		return "queryDetails";
	}
	@RequestMapping("/reader_details")
	public String reader_selectOne(Integer id,Model model) {
		Books books=bookService.selectOne(id);
		model.addAttribute("details",books);
		return "reader_details";
	}
	@RequestMapping("/reader_queryDetails")
	public String reader_queryDetails(Integer id,Model model) {
		Books books=bookService.selectOne(id);
		model.addAttribute("details",books);
		return "reader_queryDetails";
	}
	/**
	 * 跳转到更新图书界面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateBook")
	public String updateBook(Integer id,Model model) {
		Books update=bookService.selectOne(id);
		model.addAttribute("update",update);
		return "updateBook";
	}
	@RequestMapping("/updateQuery")
	public String updateQuery(Integer id,Model model) {
		Books update=bookService.selectOne(id);
		model.addAttribute("update",update);
		return "updateQuery";
	}
	/**
	 * 根据id更新图书信息
	 * @param books
	 * @return
	 */
	@RequestMapping("/update")
	public String update(Books books) {
		bookService.update(books);
		return "redirect:/book/allBooks";
	}
	@RequestMapping("/doUpdateQuery")
	public String doUpdateQuery(Books book,Model model) {
		bookService.update(book);
		List<Books> books=bookService.queryBooks(book.getName());
		model.addAttribute("books",books);
		return "queryBook";
	}
	/**
	 * 根据id删除图书信息
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(Integer id) {
		bookService.delete(id);
		return "redirect:/book/allBooks";
	}
	/**
	 * 根据图书名查询图书信息
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping("/queryBook")
	public String query(String name,Model model) {
		List<Books> books=bookService.queryBooks(name);
		model.addAttribute("books",books);
		return "queryBook";
	}
	@RequestMapping("/reader_queryBook")
	public String reader_queryBook(String name,Model model) {
		List<Books> books=bookService.queryBooks(name);
		model.addAttribute("books",books);
		return "reader_queryBook";
	}
	/**
	 * 根据id查询图书信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/borrow")
	public String borrow(Integer id,Model model) {
		Books books=bookService.borrowId(id);
		model.addAttribute("books",books);
		return "borrow";
	}
	/**
	 * 根据图书id归还图书
	 * @param id
	 * @return
	 */
	@RequestMapping("/returnBook")
	public String returnBook(Integer id) {
		bookService.returnBook(id);
		dateRecordService.returnDate(id);
		return "redirect:/date/borrowReturn";
	}
}
