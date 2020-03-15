package com.daos;

import com.beans.News;
import com.jdbc.ConnectionPool;
import java.sql.*;
import java.util.ArrayList;

public class NewsDao {

    public boolean add(News news, String[] catids) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();

        if (con != null) {
           try {
                  con.setAutoCommit(false);

            
                String sql = "Insert into news(title, description, image, reporter_id, status,status_text) values(?,?,?,?,?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, news.getTitle());
                smt.setString(2, news.getDescription());
                smt.setString(3, news.getImage());
                smt.setInt(4, news.getReporter_id());
                smt.setString(5, news.getStatus());
                smt.setString(6, news.getStatus_text());

                smt.executeUpdate();

                sql = "select id from news order by id desc limit 1";
                smt = con.prepareStatement(sql);
                ResultSet rs = smt.executeQuery();
                int news_id = -1;
                if (rs.next()) {
                    news_id = rs.getInt("id");

                    for (String catid : catids) {
                        sql = "insert into newstype (news_id,cat_id) values(?,?)";
                        smt = con.prepareStatement(sql);
                        smt.setInt(1, news_id);
                        smt.setInt(2, Integer.parseInt(catid));
                        smt.executeUpdate();
                    }
                }
                con.commit();
                status = true;
                smt.close();

            } catch (Exception e) {
             try{   con.rollback(); } catch(Exception ex) {System.out.println("Rollback error");}
                System.out.println("Error " + e.getMessage());
            }
           finally{
                cp.putConnection(con);
          }
        }
        return status;
    }

    public boolean removeById(int id) {
        boolean status = false;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "Delete from news where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id);

                int n = smt.executeUpdate();
                if (n > 0) {
                    status = true;
                    System.out.println("News Removed !!");
                }

                cp.putConnection(con);
                smt.close();

            }

        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return status;
    }

    public News getById(int id) {
        News news = null;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from news where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    news = new News();
                    news.setId(rs.getInt("id"));
                    news.setTitle(rs.getString("title"));
                    news.setDescription(rs.getString("description"));
                    news.setImage(rs.getString("image"));
                    news.setReporter_id(rs.getInt("reporter_id"));
                    news.setStatus(rs.getString("status"));
                    news.setStatus_text(rs.getString("status_text"));
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return news;
    }

    public ArrayList<News> getAllNews() {
        ArrayList<News> newsList = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from news";
                PreparedStatement smt = con.prepareStatement(sql);

                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    News news = new News();
                    news.setId(rs.getInt("id"));
                    news.setTitle(rs.getString("title"));
                    news.setDescription(rs.getString("description"));
                    news.setImage(rs.getString("image"));
                    news.setReporter_id(rs.getInt("reporter_id"));
                    news.setStatus(rs.getString("status"));
                    news.setStatus_text(rs.getString("status_text"));

                    newsList.add(news);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return newsList;
    }

    public ArrayList<News> getNewsByLimit(int start, int stop) {
        ArrayList<News> newsList = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from news limit ?, ?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, start);
                smt.setInt(2, stop);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    News news = new News();
                    news.setId(rs.getInt("id"));
                    news.setTitle(rs.getString("title"));
                    news.setDescription(rs.getString("description"));
                    news.setImage(rs.getString("image"));
                    news.setReporter_id(rs.getInt("reporter_id"));
                    news.setStatus(rs.getString("status"));
                    news.setStatus_text(rs.getString("status_text"));

                    newsList.add(news);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }
        return newsList;
    }

    public int getNewsCount() {
        int total = 0;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select count(*) from news";
                PreparedStatement smt = con.prepareStatement(sql);

                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    total = rs.getInt(1);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return total;

    }

    public ArrayList<News> getNewsByCatId(int catid) {
        ArrayList<News> newsList = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from news where status='approved' and id in (select news_id from newstype where cat_id =?) order by id desc";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, catid);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    News news = new News();
                    news.setId(rs.getInt("id"));
                    news.setTitle(rs.getString("title"));
                    news.setDescription(rs.getString("description"));
                    news.setImage(rs.getString("image"));
                    news.setReporter_id(rs.getInt("reporter_id"));
                    news.setStatus(rs.getString("status"));
                    news.setStatus_text(rs.getString("status_text"));

                    newsList.add(news);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }
        return newsList;
    }

    
     public ArrayList<News> getNewsByReporterId(int reporterid) {
        ArrayList<News> newsList = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from news where reporter_id=?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, reporterid);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    News news = new News();
                    news.setId(rs.getInt("id"));
                    news.setTitle(rs.getString("title"));
                    news.setDescription(rs.getString("description"));
                    news.setImage(rs.getString("image"));
                    news.setReporter_id(rs.getInt("reporter_id"));
                    news.setStatus(rs.getString("status"));
                    news.setStatus_text(rs.getString("status_text"));

                    newsList.add(news);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }
        return newsList;
    }

     
     public ArrayList<News> getAllNewsByStatus(String status) {
        ArrayList<News> newsList = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from news where status=? order by id desc";
                PreparedStatement smt = con.prepareStatement(sql);
                 smt.setString(1, status);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    News news = new News();
                    news.setId(rs.getInt("id"));
                    news.setTitle(rs.getString("title"));
                    news.setDescription(rs.getString("description"));
                    news.setImage(rs.getString("image"));
                    news.setReporter_id(rs.getInt("reporter_id"));
                    news.setStatus(rs.getString("status"));
                    news.setStatus_text(rs.getString("status_text"));

                    newsList.add(news);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return newsList;
    }
     
     
     public ArrayList<News> getAllNewsByStatus(String status, int reporterid) {
        ArrayList<News> newsList = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from news where status=? and reporter_id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, status);
                smt.setInt(2, reporterid);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    News news = new News();
                    news.setId(rs.getInt("id"));
                    news.setTitle(rs.getString("title"));
                    news.setDescription(rs.getString("description"));
                    news.setImage(rs.getString("image"));
                    news.setReporter_id(rs.getInt("reporter_id"));
                    news.setStatus(rs.getString("status"));
                    news.setStatus_text(rs.getString("status_text"));

                    newsList.add(news);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return newsList;
    }


     
     public int getNewsCountByCategory(int catid) {
        int total = 0;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select count(*) from newstype where cat_id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, catid);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    total = rs.getInt(1);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return total;

    }
     
      public int getApprovedCountByCategory(int catid) {
        int total = 0;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select count(*) from news where status='approved' and id in (select news_id from newstype where cat_id=?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, catid);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    total = rs.getInt(1);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return total;

    }

public boolean update(News news,int[] catids){
    boolean status =false;
    ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();

        if (con != null) {
           try {
                  con.setAutoCommit(false);

            
                String sql = "update news set title=?, description=?, image=? where id = ?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, news.getTitle());
                smt.setString(2, news.getDescription());
                smt.setString(3, news.getImage());
                smt.setInt(4, news.getId());
                smt.executeUpdate();
                
                sql = "delete from newstype where news_id=?";
                smt = con.prepareStatement(sql);
                smt.setInt(1, news.getId());
                smt.executeUpdate();

              for (int catid : catids) {
                        sql = "insert into newstype (news_id,cat_id) values(?,?)";
                        smt = con.prepareStatement(sql);
                        smt.setInt(1, news.getId());
                        smt.setInt(2, catid);
                        smt.executeUpdate();
                    }
                
                con.commit();
                status = true;
                smt.close();

            } catch (Exception e) {
             try{   con.rollback(); } catch(Exception ex) {System.out.println("Rollback error");}
                System.out.println("Error " + e.getMessage());
            }
           finally{
                cp.putConnection(con);
          }
        }
    
    return status;
} 

public boolean updateNewsStatus(News news, String status,String statusText){
    boolean sts = false;
    ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();

        if (con != null) {
           try {
                String sql = "update news set status=?, status_text=? where id = ?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, status);
                smt.setString(2, statusText);
                smt.setInt(3, news.getId());
                smt.executeUpdate();
                cp.putConnection(con);
                sts = true;
                smt.close();

            } catch (Exception e) {
              System.out.println("Error " + e.getMessage());
            }
       }
     return sts;
}
    
    public static void main(String[] args) {
        System.out.println("hello");
    }
}
