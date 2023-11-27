<%-- 
    Document   : quanlydonhang
    Created on : May 26, 2023, 4:19:49 PM
    Author     : Tan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.Order"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,500;0,700;1,500&family=Rubik+Distressed&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="fontawesome-free-6.3.0-web/css/all.min.css">
        <link rel="stylesheet" href="./css/check.css">
        <script src="https://kit.fontawesome.com/6d254ad403.js" crossorigin="anonymous"></script>
       
    </head>
    <style>
        .table-data{
        }
    .home_page{
        margin-left: 100px;
    }
    table{
        width: 85%;
        margin: 0 auto;
    }
    table,  td {
        border: 2px solid;
        font-size: 12px;
        padding: 5px;
    }

    th{
        border-right: 2px solid;
        padding-bottom: 10px;
    }

    td{
        padding: 10px;
    }
    </style>
    <body>
        <div class="header">
            <div class="header_icon">
                <ul class="headericon">
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-facebook" style="color:black"></i></a>
                    </li>
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-twitter" style="color:black"></i></a>
                    </li>
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-google-plus-g" style="color:black"></i></a>
                    </li>
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-youtube" style="color:black"></i></a>
                    </li>
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-linkedin-in" style="color:black"></i></a>
                    </li>
        
                </ul>
            </div>
            <div class="header_item">
                <ul class="item_logo">
                   <li class="logo">
                       <a href="text.jsp"> <img src="http://cdn0308.cdn4s.com/media/logo/logo.png"></a>
                   </li>
                </ul>
                <ul class="item_navbar">
                        <li class="navbar">
                            <a href="sanpham.html">Sản phẩm</a>
                            <div class="header_navbar">
                                <ul class="header_navbar-sanpham">
                                    <li>
                                        <a href="Docking.html">Docking Station</a>
                                    </li>
                                    <li>
                                        <a href="hub.html">HUBS</a>
                                    </li>
                                    <li >
                                        <a href="cap.html">Cáp các loại</a>
                                    </li>
                                    <li >
                                        <a href="phukien.html">Phụ kiện khác</a>
                                    </li>
                                </ul>                          
                            </div>
                        </li> 
                        <li class="navbar">
                            <a href="support.html">Hỗ trợ</a>
                        </li>   
                        <li class="navbar">
                            <a href="about-us.html">Về chúng tôi</a>
                        </li>
                        <li class="navbar">
                            <a href="liên-hệ.html">Mua ở đâu</a>
                        </li>
                        <li class="navbar">
                            <a href="tin-tức.html">Tin tức</a>
                        </li>
                 </ul>
                <ul class="item_icon" >
                    <li class="item__icon"style="margin-right:20px">
                        <a href=""><i class="fa-regular fa-user"style="color:black"></i></a>
                    </li>
                    <li class="item__icon"style="margin-right:20px">
                        <a href=""><i class="fa-solid fa-magnifying-glass"style="color:black"></i></a>
                    </li>
                    <li class="item__icon"style="margin-right:20px">
                        <a href=""><i class="fa-solid fa-cart-plus"style="color:black"></i></a>
                    </li>
        
                </li>
                </ul>
            </div>
            <div class="header_list">
                <button class="list-js">Giao hàng miễn phí với đơn hàng trên 5.000.000 vnđ</button>
                <button class="list-js__2">Chính sách trả và đổi hàng trong vòng 30 ngày</button>
                <button class="list-js__3">Bảo hành chất lượng sản phẩm lên tới 12 tháng</button>
                <button class="list-js__4">Hỗ trợ khách hàng 24/7</button>
            </div>
        </div>
        <div class="home_page">
            <a href="text.jsp">Trang chủ ><b>Quản lý đơn hàng</b></a>
        </div>
        <table class="table-data">
            <tr>
                <th>STT</th>
                <th>Họ và tên</th>
                <th>Số điện thoại</th>
                <th>Địa chỉ</th>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Phương thức thanh toán</th>
                <th>Ngày d?t</th>
                <th>Tổng tiền</th>
                <th>Tùy chọn</th>
                
                <!--<th>Thâm niên</th>-->
            </tr>
            <% 
                ArrayList<Order> ctvList = (ArrayList<Order>) session.getAttribute("orderlist");
                int stt = 1;
            %>
            
            <% if (ctvList != null) {%>
            <%for(Order x : ctvList){%>
            <tr>
                <td class = "id"><%=x.getId()%></td>
                <td><%=x.getFullname()%></td>
                <td><%=x.getPhone()%></td>
                <td><%=x.getAddress()%></td>
                <td><%=x.getTensp()%></td>
                <td><%=x.getSoluong()%></td>
                <td><%=x.getPaymentMethod()%></td>
                <td><%=x.getTongtien()%></td>
                <td class = "huydon-btn" style = "color: blue; cursor: pointer">Hủy đơn hàng</td>
            </tr>
            <%} }%>
            </tr>
        </table>
        <div class="footer">
            <div class="boxcenter">
                <div class="row1">
                  <a href="">
                    <img
                      src="http://cdn0308.cdn4s.com/media/gioi-thieu/gioi-thieu.jpg"
                      style="width: 960px; height: 430px"
                    />
                  </a>
                </div>
                <div class="row2">
                  <h2 class="heading" style="font-size: 150%">
                    CÔNG TY CỔ PHẦN THƯƠNG <br />
                    MẠI KIẾN HƯNG VIỆT NAM
                  </h2>
                  <div>
                    LENTION là thương hiệu toàn cầu chuyên về phụ kiện kỹ thuật số như bộ
                    điều hợp, chuyển đổi, đế cắm, cáp và các phụ kiện dành cho laptop,
                    tablet khác, cung cấp các giải pháp tốt nhất và đáp ứng nhu cầu sáng
                    tạo cho khách hàng.
                  </div>
                  <br />
                  <div>
                    Là một thương hiệu dựa trên khách hàng, Lention nhấn mạnh vào việc
                    kiểm soát chất lượng nghiêm ngặt và hoàn thành các dịch vụ sau bán
                    hàng. Bằng cách chia sẻ ý tưởng về các sản phẩm và dịch vụ, chúng tôi
                    hy vọng mọi khách hàng đều có thể cảm nhận được sự cải tiến và lợi ích
                    mang lại từ các sản phẩm và nhận ra khái niệm LENTION. KIẾN HƯNG tự
                    hào là nhà phân phối chính hãng các sản phẩm mang thương hiệu LENTION,
                    quý khách có nhu cầu đặt hàng vui lòng liên hệ chúng tôi để biết thêm
                    chi tiết.
                  </div>
                </div>
              </div>
              <hr class="hrColor" />
              <div class="table">
                <div class="table1">
                  <h3 class="heading" style="font-size: 130%">
                    CÔNG TY CỔ PHẦN THƯƠNG MẠI KIẾN HƯNG VIỆT NAM
                  </h3>
                  <div class="info">
                    <div>
                      KIẾN HƯNG tự hào là nhà phân phối chỉnh hãng các sản phẩm mang
                      thương hiệu LENTION, quý khách có nhu cầu <br />đặt hàng vui lòng
                      liên hệ chúng tôi để biết thêm chi tiết.
                    </div>
                    <br />
                    <div>
                      <b>Địa chỉ :</b> Số nhà 5A, ngõ 4, đường Lý Tự Trọng, Phường La Khê,
                      Quận Hà Đông
                    </div>
                    <br />
                    <div><b>Số điện thoại : </b>0922103999</div>
                    <br />
                    <div><b>Email :</b> kienhungvncompany@gmail.com</div>
                    <br />
                    <div>Thời gian làm việc: 8-17h</div>
                    <br />
                    <div class="icon-container">
                      <div class="icon">
                        <a href=""><i class="fa-brands fa-facebook-f"></i></a>
                      </div>
                      <div class="icon">
                        <a href=""><i class="fa-brands fa-twitter"></i></a>
                      </div>
                      <div class="icon">
                        <a><i class="fa-brands fa-google-plus-g"></i></a>
                      </div>
                      <div class="icon">
                        <a href=""><i class="fa-brands fa-youtube"></i></a>
                      </div>
                      <div class="icon">
                        <a href=""><i class="fa-brands fa-linkedin"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
          
                <div class="table2">
                  <ul class="row_boxfooter2">
                    <h3 class="heading" style="font-size: 130%">VỀ CHÚNG TÔI</h3>
                    <p><a href="">Liên hệ</a></p>
                    <p><a href="">Chính sách vận chuyển</a></p>
                    <p><a href="">Chính sách bảo hành</a></p>
                    <p><a href="">Chính sách đổi trả</a></p>
                    <p><a href="">Tin khuyến mãi</a></p>
                    <p><a href="">Hệ thống đại lý</a></p>
                  </ul>
                </div>
          
                <div class="table3">
                  <div class="row boxfooter3">
                    <h3 class="heading" style="font-size: 130%">MAP</h3>
                    <iframe
                      src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14902.090252383596!2d105.769882!3d20.97168!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313453262cb85207%3A0x2c3d48f455e506c!2zNCBMw70gVOG7sSBUcuG7jW5nLCBQLiBRdWFuZyBUcnVuZywgSMOgIMSQw7RuZywgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2sus!4v1678213773058!5m2!1svi!2sus"
                      width="300"
                      height="300"
                      style="border: 0"
                      allowfullscreen=""
                      loading="lazy"
                      referrerpolicy="no-referrer-when-downgrade"
                    ></iframe>
                  </div>
                </div>
              </div>
              <div class="copyright">
                <hr class="hrColor" />
                <p>Copyright © 2021 Lention All rights reserved.</p>
              </div>
        </div>
        <script>
            const huyDonBtns = document.querySelectorAll('.huydon-btn')
            for (huyDonBtn of huyDonBtns){
                huyDonBtn.addEventListener('click', (e)=>{
                    e.preventDefault()
                    parentDiv = e.target.parentNode
                    let data = JSON.stringify({
                        "id":  parentDiv.querySelector('.id').textContent
                    })

                    console.log(data)
                    let xhr = new XMLHttpRequest()
                    xhr.open('POST', 'http://localhost:9999/d20btlweb/ProcessHuyDonHang', true)
                    xhr.setRequestHeader('Content-Type', 'application/json')
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                            // Xử lý phản hồi từ server.
//                            console.log('heheh')
                        }
                    };
                    xhr.send(data)
                    location.reload()
                })
            }
        </script>
    </body>
</html>
