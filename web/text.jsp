<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.Validate"%>
<!DOCTYPE html>
<html>
<head>
 <title>Web bán hàng</title>
 <meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,500;0,700;1,500&family=Rubik+Distressed&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
 <!--<link rel="stylesheet" href="fontawesome-free-6.3.0-web/css/all.min.css">-->
 <link rel="stylesheet" href="./css/check.css">
 <script src="https://kit.fontawesome.com/6d254ad403.js" crossorigin="anonymous"></script>

</head>
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
                   <a href="homeServlet"> <img src="http://cdn0308.cdn4s.com/media/logo/logo.png"></a>
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
                        <a href="group.html">Group</a>
                    </li>
             </ul>
            <ul class="item_icon">
                <%if (session.getAttribute("email")!=null){%>
                <div class="logout">
                    <a href="ProcessLogout">Sign out</a>
                </div>
                <%}%>
                <button class="item__icon1">
                    <i class="fa-regular fa-user"style="color:black"></i>
                </button>
                <button class="item__icon4">
                    <i class="fa-regular fa-user"style="color:black"></i>
                </button>
                 <div class="user-email"><%= Validate.StringUtil((String) session.getAttribute("name"))%></div>
                <div class="modal-form" >
                    <div class="modal-overlay__form">
                    </div>
                    <div class="modal-form__body">
                        <div class="form-login">
                            <div class="form-login-header">
                                <h2>Đăng nhập</h2>
                                <button class="form-login-header__icon">
                                 <i class="fa-solid fa-x"></i>
                                </button>
                            </div>
                            
                            <%
                                if (request.getAttribute("loginFail") == "fail") {
                            %>
                            <div style="color: red; padding-left: 5px" class="login_fail" value="">Sai tài kho?n ho?c m?t kh?u</div>
                            <script>
                                $(document).ready(function() {
                                    var loginFailCookie = getCookie("loginFail");
                                        if (loginFailCookie === "true") {
                                            alert("Login failed. Please try again.");
                                            document.cookie = "loginFail=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;"; // Xóa cookie sau khi hiển thị thông báo
                                        }                                       
                                    });

                                    // Hàm để lấy giá trị của một cookie dựa trên tên
                                function getCookie(name) {
                                    var cookieName = name + "=";
                                    var decodedCookie = decodeURIComponent(document.cookie);
                                    var cookieArray = decodedCookie.split(';');
                                    for (var i = 0; i < cookieArray.length; i++) {
                                        var cookie = cookieArray[i];
                                        while (cookie.charAt(0) === ' ') {
                                            cookie = cookie.substring(1);
                                        }
                                        if (cookie.indexOf(cookieName) === 0) {
                                            return cookie.substring(cookieName.length, cookie.length);
                                        }
                                    }
                                    return "";
                                }
                            </script>
                            <%
                                }
                            %>

                            <script>
                                $(document).ready(function() {
                                    var loginSuccessCookie = getCookie("loginSuccess");
                                    if (loginSuccessCookie === "true") {
//                                            alert("Success")
                                        var loginForm = document.querySelector('.item__icon1');
                                        loginForm.style.display = 'none';

                                        var profile = document.querySelector('.item__icon4');
                                        profile.style.display = 'block';
                                    }     
                                });

                                function getCookie(name) {
                                    var cookieName = name + "=";
                                    var decodedCookie = decodeURIComponent(document.cookie);
                                    var cookieArray = decodedCookie.split(';');
                                    for (var i = 0; i < cookieArray.length; i++) {
                                        var cookie = cookieArray[i];
                                        while (cookie.charAt(0) === ' ') {
                                            cookie = cookie.substring(1);
                                        }
                                        if (cookie.indexOf(cookieName) === 0) {
                                            return cookie.substring(cookieName.length, cookie.length);
                                        }
                                    }
                                    return "";
                                }
                            </script>
                                
                                
                            <div class="form-login-body">
                                <form action="ProcessLogin" method="post">
                                    <div class="form-group">
                                        <label for="username">
                                            Tài khoản
                                            <span class="required">*</span>
                                        </label>
                                        <input id="username" name="username" type="text" class="form-required">
                                    </div>
                                    <div class="form-group">
                                        <label for="passwordlogin">
                                            Mật khẩu
                                            <span class="required">*</span>
                                        </label>
                                        <input id="password" name="password" type="password" class="form-required">
                                    </div>
                    
                                    <button type = "submit" class="btn-submit">Đăng nhập </button>
                                    <a href="" class="btn-login-social btn-facebook">
                                        <i class="logo-facebook ti-facebook">Facebook</i>
                                    </a>
                                    <a href="" class="btn-login-social btn-google">
                                        <i class="ti-google">Google</i>
                                    </a>
                                    <div class="d-flex">
                                        <a class="form-register" href="form-dky.html">
                                            <b>Đăng kí tài khoản mới</b>
                                        </a>
                                        <a class="form-forgot-password" href="">Quên mật khẩu?</a>
                                    </div>
                                    <input type="hidden" name="redirect" value>
                                </form>
                            </div>
                        </div>
                      
                        
                    </div>
                </div>
                <div class="profile" >    
                    <Center>
                        <div class="modal-profile__body" style="background-color: #ccc; width: 30%; margin-top: 10%;padding-bottom: 1%;;text-align: left">
                            <div class="form-profile-header">
                                <h2 style="color:red">PROFILE</h2>
                                <button class="form-profile-header__icon">
                                     <i class="fa-solid fa-x"></i>
                                </button>
                            </div>
                            <form method="post" action="EditUser">
                                <input type="hidden" value="update" name="action">
                                <label style="margin-left: 55px">EMail: <input type="text" value="<%= Validate.StringUtil((String) session.getAttribute("email"))%>" style="text-align: left; width: 100%" readonly name="email_name"></label><br>
                                <label style="margin-left: 55px">Name: <input type="text" value="<%= Validate.StringUtil((String) session.getAttribute("name"))%>" style="text-align: left; width: 99%"  name="client_name"></label><br>
                                <label style="margin-left: 55px">S? di?n tho?i: <input type="text" value="<%= Validate.StringUtil((String) session.getAttribute("tel"))%>" style="text-align: left; width: 82.5%;" name="tel"></label> <br>
                                <label style="margin-left: 55px">Address: <input type="text" value="<%= Validate.StringUtil((String) session.getAttribute("address"))%>" style="text-align: left; width: 93%;" name="address_name"></label><br>
                                <input type="submit" id="submit" value="Update" style="margin-left: 40%">
                            </form>
                        </div>
                    </Center>
                    
                </div>                    
                        
                        
                <a class="item__icon2" >
                    <i class="fa-solid fa-magnifying-glass"style="color:black"></i></a>
                </a>
                <a class="item__icon3"href = "quanlydonhang.jsp">
                    <i class="fa-solid fa-cart-plus"style="color:black"></i>
                </a>
    
            </li>
            </ul>
        </div>
        <div class="header_list">
            <button class="list-js">Giao hàng miễn phí với đơn hàng trên 5.000.000 vnđ</button>
            <div class="modal">
                <div class="modal-overlay">
            
                </div>
                <div class="modal-body">
                    <div class="modal-body__header">
        
                        <h2 class="modal-body__header-js">Giao hàng miễn phí với đơn hàng trên 5.000.000 vnđ
                        </h2> 
                        <div class="modal-body__icon-js">
                            <i class="fa-solid fa-x"></i>
                        </div> 
                    </div>
                    <p>Chúng tôi đang cung cấp dịch vụ vận chuyển miễn phí đến tận nơi cho tất cả các khách hàng ở Việt Nam. Chúng tôi đang cung cấp miễn phí giao hàng tiêu chuẩn cho các đơn hàng trên 5.000.000 vnđ. Vui lòng xem chính sách giao hàng của chúng tôi để biết thêm chi tiết. (Do COVID-19 thời gian vận chuyển có thể thay đổi).</p>
                </div>
            </div>
            <button class="list-js__2">Chính sách trả và đổi hàng trong vòng 30 ngày</button>
            <div class="modal1">
                <div class="modal-overlay1">
            
                </div>
                <div class="modal-body1">
                    <div class="modal-body__header1">
        
                        <h2 class="modal-body__header-js1">Chính sách trả và đổi hàng trong vòng 30 ngày
                        </h2> 
                        <div class="modal-body__icon-js1">
                            <i class="fa-solid fa-x"></i>
                        </div> 
                    </div>
                    <p>Nếu vì bất kỳ lý do gì mà bạn không hài lòng với sản phẩm Lention, bạn có thể trả lại hoặc đổi hàng trong tình trạng ban đầu miễn là bạn liên hệ với chúng tôi trong vòng 30 ngày kể từ ngày giao hàng.</p>
                    <p>Hotline: 0922103999</p>
                    <p>Mail: kienhungvncompany@gmail.com</p>
                </div>
            </div>
            <button class="list-js__3">Bảo hành chất lượng sản phẩm lên tới 12 tháng</button>
            <div class="modal2">
                <div class="modal-overlay2">
            
                </div>
                <div class="modal-body2">
                    <div class="modal-body__header2">
        
                        <h2 class="modal-body__header-js2">Chính sách trả và đổi hàng trong vòng 30 ngày
                        </h2> 
                        <div class="modal-body__icon-js2">
                            <i class="fa-solid fa-x"></i>
                        </div> 
                    </div>
                    <p>Tất cả các sản phẩm của lention.vn đều được bảo hành chất lượng 12 tháng. Bất kỳ mặt hàng nào có vấn đề về chất lượng đều được đảm bảo THAY THẾ hoặc HOÀN TIỀN ĐẦY ĐỦ theo chi phí chiết khấu còn lại của thời hạn bảo hành. Mọi vấn đề sau bán hàng có thể được xử lý trực tiếp bằng cách gửi số đơn đặt hàng cho chúng tôi qua email support@lention.vn hoặc kienhungvncompany@gmail.com. Hãy yên tâm về chất lượng sản phẩm Lention, chúng tôi cam kết hỗ trợ kỹ thuật và các dịch vụ sau bán hàng .</p>
                </div>
            </div>
            <button class="list-js__4">Hỗ trợ khách hàng 24/7</button>
            <div class="modal3">
                <div class="modal-overlay3">
            
                </div>
                <div class="modal-body3">
                    <div class="modal-body__header3">
        
                        <h2 class="modal-body__header-js3">Chính sách trả và đổi hàng trong vòng 30 ngày
                        </h2> 
                        <div class="modal-body__icon-js3">
                            <i class="fa-solid fa-x"></i>
                        </div> 
                    </div>
                    <p>Vui lòng gửi về support@lention.vn hoặc kienhungvncompany@gmail.com để chúng tôi tìm hiểu vấn đề của bạn và chúng tôi sẽ liên hệ lại với bạn trong vòng 24 giờ để giải quyết.</p>      </div>
            </div>
        </div>
        <div class="slider">
            <div class="control prev"><i class="fa-sharp fa-solid fa-chevron-left"></i></div>
            <div class="control next"><i class="fa-sharp fa-solid fa-chevron-right"></i></div>
        </div>
        <div class="classify">
            <div class="header_header">
                <div class="header_header1">
                    <a href="Docking.html">Docking Stations</a>
                </div>
                <div class="header_header2">
                    <a href="hub.html">HUBS</a>
                </div>
                <div class="header_header3">
                    <a href="cap.html">Charger&Cables</a>
                </div>
                <div class="header_header4">
                    <a href="phukien.html">Other Accessones</a>
                </div>
            </div>
            <div class="select">
                <h1 style="text-align: center;">Trung tâm của bạn, Lựa chọn của bạn</h1>
                <p style="text-align: center;">Máy tính của bạn kết nối với những cổng USB nào?</p>
            </div>
            <div class="select1">
                <div class="table_tb1">
                      <div class="haz_hubs">
                         <a href="hub.html">HUBS</a>
                       </div>
                </div>
                <div class="table_tb2">
                    <div class="haz_cap">
                         <a href="cap.html">Cáp các loại</a>
                    </div>  
                </div>    
            </div>  
            <div class="select2" >
                 <a href="homeServlet"style="color:black">XEM THÊM</a>     
            </div>
        </div>
    </div>
    <div class="container">
        <div class="item">
            <div class="item-header">
                <span >
                    Sản phẩm bán chạy
                </span>
            </div>
            <div class="grid__row">
                <div class="grid__column-4" style="margin-left: 48px;">
                    <div class="item-border">
                        <a href="http://lention.vn/" class="item-list__img" target="_blank" title="">
                            <div class="item-list__img--display" style="background-image:url(http://cdn0308.cdn4s.com/thumbs/san-pham/h23-1_thumb_350.jpg)">
                            </div>
                            <div class="item-list__img--hidden" style="background-image:url(http://cdn0308.cdn4s.com/thumbs/san-pham/hubs/c35-1m-1_thumb_350.jpg)">
                            </div>
                            <div class="item-list__img--outstand">
                                nổi bật
                            </div>
                            <div class="item-list__img--option">
                                <ul class="item-list__img--option-list">
                                    <li class="item-list__img--option-item">
                                        <div href="" class="item-list__img--option-link" title="Mua hàng" target="_blank" id="H23s-GR">
                                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                                        </div>
                                    </li>
                                    <li class="item-list__img--option-item">
                                        <a href="" class="item-list__img--option-link" title="xem nhanh" style = "height:44px; transform: translateY(10px); ">
                                           <i class="fa-solid fa-eye"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </a>
                        
                        <div class="item-list__description">
                            <a href="" class="item-list__description-title">
                              Bộ chuyển đổi USB-A 4 trong 1 Lention H23s
                            </a>
                          </div>
                        <div class="item-list__price">
                            <div class="item-list__price-num">
                                869,000 <span style="font-size:1.1rem">VND</span>
                                
                            </div>
                            <div class="item-list__price-star">
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
    
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid__column-4" style="margin-left: 48px;">
                    <div class="item-border">
                        <a href="http://lention.vn/" class="item-list__img" target="_blank" title="">
                            <div class="item-list__img--display" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/hubs/h92.png)">
                            </div>
                            <div class="item-list__img--hidden" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/hubs/h92-8.jpg)">
                            </div>
                            <div class="item-list__img--outstand">
                               nổi bật
                            </div>
                            <div class="item-list__img--option">
                                <ul class="item-list__img--option-list">
                                    <li class="item-list__img--option-item">
                                        <div href="" class="item-list__img--option-link" title="Mua hàng" target="_blank" id="H92-BK">
                                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                                        </div>
                                    </li>
                                    <li class="item-list__img--option-item">
                                        <a href="" class="item-list__img--option-link" title="Xem nhanh" style = "height:44px; transform: translateY(10px); ">
                                            <i class="fa-regular fa-eye"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </a>
                        
                        <div class="item-list__description">
                            <a href="" class="item-list__description-title">
                                Bộ chia 7 cổng USB A 3.0 Lention H92
                            </a>
    
                        </div>
                        <div class="item-list__price">
                            <div class="item-list__price-num">
                                1,500,000 <span style="font-size:1.1rem">VND</span>
                                
                            </div>
                            <div class="item-list__price-star">
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
    
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid__column-4" style="margin-left: 48px;">
                    <div class="item-border">
                        <a href="http://lention.vn/" class="item-list__img" target="_blank" title="?????">
                            <div class="item-list__img--display" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/d92.jpg)">
                            </div>
                            <div class="item-list__img--hidden" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/d92-1.jpg)">
                            </div>
                            <div class="item-list__img--outstand">
                                nổi bật
                            </div>
                            <div class="item-list__img--option">
                                <ul class="item-list__img--option-list">
                                    <li class="item-list__img--option-item">
                                        <div href="" class="item-list__img--option-link" title="Mua hàng" target="_blank" id="D92HDEAM">
                                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                                        </div>
                                    </li>
                                    <li class="item-list__img--option-item">
                                        <a href="" class="item-list__img--option-link" title="xem nhanh" style = "height:44px; transform: translateY(10px); ">
                                            <i class="fa-regular fa-eye"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </a>
                        
                        <div class="item-list__description">
                            <a href="" class="item-list__description-title">
                                Bộ chuyển đổi USB-C 15 trong 1 Lention Ultra 5K D92HDEAM
                            </a>
    
                        </div>
                        <div class="item-list__price">
                            <div class="item-list__price-num">
                                5,000,000 <span style="font-size:1.1rem">VND</span>
                                
                            </div>
                            <div class="item-list__price-star">
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
    
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid__column-4" style="margin-left: 48px;">
                    <div class="item-border">
                        <a href="http://lention.vn/" class="item-list__img" target="_blank" title="?????">
                            <div class="item-list__img--display" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/11%20%C2%A6%2B.jpg)">
                            </div>
                            <div class="item-list__img--hidden" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/8.jpg)">
                            </div>
                            <div class="item-list__img--outstand">
                                nổi bật
                            </div>
                            <div class="item-list__img--option">
                                <ul class="item-list__img--option-list">
                                    <li class="item-list__img--option-item">
                                        <div href="" class="item-list__img--option-link" title="Mua hàng" target="_blank" id="C9b">
                                           <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                                        </div>
                                    </li>
                                    <li class="item-list__img--option-item">
                                        <a href="" class="item-list__img--option-link" title="xem nhanh" style = "height:44px; transform: translateY(10px); ">
                                            <i class="fa-regular fa-eye"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </a>
                        
                        <div class="item-list__description">
                            <a href="" class="item-list__description-title">
                              Box ổ cứng SSD M2 NVMe 0.15m Lention C9b
                            </a>
    
                        </div>
                        <div class="item-list__price">
                            <div class="item-list__price-num">
                                800,000 <span style="font-size:1.1rem">VND</span>
                                
                            </div>
                            <div class="item-list__price-star">
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
    
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid__column-4" style="margin-left: 48px;">
                    <div class="item-border">
                        <a href="http://lention.vn/" class="item-list__img" target="_blank" title="?????">
                            <div class="item-list__img--display" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/cu208.jpg)">
                            </div>
                            <div class="item-list__img--hidden" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/cu208-1.jpg)">
                            </div>
                            <div class="item-list__img--outstand">
                                nổi bật
                            </div>
                            <div class="item-list__img--option">
                                <ul class="item-list__img--option-list">
                                    <li class="item-list__img--option-item">
                                        <div href="" class="item-list__img--option-link" title="Mua hàng" target="_blank" id="CU207H-BK">
                                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                                        </div>
                                    </li>
                                    <li class="item-list__img--option-item">
                                        <a href="" class="item-list__img--option-link" title="xem nhanh" style = "height:44px; transform: translateY(10px); ">
                                            <i class="fa-regular fa-eye"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </a>
                        
                        <div class="item-list__description">
                            <a href="" class="item-list__description-title">
                                Bộ chuyển đổi Type C sang Cổng DisplayPort(4K 60Hz) Lention CU208
                            </a>
    
                        </div>
                        <div class="item-list__price">
                            <div class="item-list__price-num">
                                400,000 <span style="font-size:1.1rem">VND</span>
                                
                            </div>
                            <div class="item-list__price-star">
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
    
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid__column-4" style="margin-left: 48px;">
                    <div class="item-border">
                        <a href="http://lention.vn/" class="item-list__img" target="_blank" title="?????">
                            <div class="item-list__img--display" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/c%C3%A1p%20c%C3%A1c%20lo%E1%BA%A1i/hh20-6.jpg)">
                            </div>
                            <div class="item-list__img--hidden" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/c%C3%A1p%20c%C3%A1c%20lo%E1%BA%A1i/hh20-3.jpg)">
                            </div>
                            <div class="item-list__img--outstand">
                               nổi bật
                            </div>
                            <div class="item-list__img--option">
                                <ul class="item-list__img--option-list">
                                    <li class="item-list__img--option-item">
                                        <div href="" class="item-list__img--option-link" title="Mua hàng" target="_blank" id="HH20-P2">
                                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                                        </div>
                                    </li>
                                    <li class="item-list__img--option-item">
                                        <a href="" class="item-list__img--option-link" title="xem nhanh" style = "height:44px; transform: translateY(10px); ">
                                            <i class="fa-regular fa-eye"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </a>
                        
                        <div class="item-list__description">
                            <a href="" class="item-list__description-title">
                                 Cáp HDMI to HDMI LENTION HH20-P2
                            </a>
    
                        </div>
                        <div class="item-list__price">
                            <div class="item-list__price-num">
                                869,000 <span style="font-size:1.1rem">VND</span>
                                
                            </div>
                            <div class="item-list__price-star">
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
    
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid__column-4" style="margin-left: 48px;">
                    <div class="item-border">
                        <a href="http://lention.vn/" class="item-list__img" target="_blank" title="?????">
                            <div class="item-list__img--display" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/c%C3%A1p%20c%C3%A1c%20lo%E1%BA%A1i/hpva.png)">
                            </div>
                            <div class="item-list__img--hidden" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/c%C3%A1p%20c%C3%A1c%20lo%E1%BA%A1i/hv-1.jpg)">
                            </div>
                            <div class="item-list__img--outstand">
                               nổi bật
                            </div>
                            <div class="item-list__img--option">
                                <ul class="item-list__img--option-list">
                                    <li class="item-list__img--option-item">
                                        <div href="" class="item-list__img--option-link" title="Mua hàng" target="_blank" id="HpVa-2M">
                                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                                        </div>
                                    </li>
                                    <li class="item-list__img--option-item">
                                        <a href="" class="item-list__img--option-link" title="xem nhanh" style = "height:44px; transform: translateY(10px); ">
                                            <i class="fa-regular fa-eye"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </a>
                        
                        <div class="item-list__description">
                            <a href="" class="item-list__description-title">
                              Cáp chuyển đổi HDMI to VGA (2M) Lention HpVa-2M
                            </a>
    
                        </div>
                        <div class="item-list__price">
                            <div class="item-list__price-num">
                                489,000 <span style="font-size:1.1rem">VND</span>
                                
                            </div>
                            <div class="item-list__price-star">
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
    
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid__column-4" style="margin-left: 48px;">
                    <div class="item-border">
                        <a href="http://lention.vn/" class="item-list__img" target="_blank" title="?????">
                            <div class="item-list__img--display" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/c%C3%A1p%20c%C3%A1c%20lo%E1%BA%A1i/hh20-6.jpg)">
                            </div>
                            <div class="item-list__img--hidden" style="background-image:url(http://cdn0308.cdn4s.com/media/san-pham/c%C3%A1p%20c%C3%A1c%20lo%E1%BA%A1i/hh20-3.jpg)">
                            </div>
                            <div class="item-list__img--outstand">
                                nổi bật
                            </div>
                            <div class="item-list__img--option">
                                <ul class="item-list__img--option-list">
                                    <li class="item-list__img--option-item">
                                        <div href="" class="item-list__img--option-link" title="Mua hàng" target="_blank" id="HH20-P2">
                                           <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                                        </div>
                                    </li>
                                    <li class="item-list__img--option-item">
                                        <a href="" class="item-list__img--option-link" title="xem nhanh" style = "height:44px; transform: translateY(10px); ">
                                            <i class="fa-regular fa-eye"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </a>
                        
                        <div class="item-list__description">
                            <a href="" class="item-list__description-title">
                                Cáp HDMI to HDMI LENTION HH20-P2
                            </a>
    
                        </div>
                        <div class="item-list__price">
                            <div class="item-list__price-num">
                                869,000 <span style="font-size:1.1rem">VND</span>
                                
                            </div>
                            <div class="item-list__price-star">
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
    
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>

             <div class="item-footer">
                 <a href="product" class="item-footer__btn" style='text-decoration:none'>
            Xem tất cả
        </a>
        </div>

        </div>
    </div>
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
              <div class="table1" style="padding-left: 20px">
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
                
    <div class="modal-banhang an">
        <div class="thunghang">
            <div>
                <div class ="dong" style="background-color: red; width: 8%; float:right;">Đóng</div>
            </div>
            <input type="text" namme ="phone" class="modal-phone" placeholder = "Số điện thoại"/>
            <input type="text" namme ="address" class="modal-address" placeholder = "Địa chỉ"/>
            <div class ='kk'>
                <label >Số lượng</label>
            <input type="number" namme ="quantity" class="modal-quantity" min = "1" max = '100' value="1" placeholder = "Số lượng"/>
            </div>
            <select class="modal-payment" id="modal__payment-method">
                <option value="directly">Thanh toán khi nhận hàng</option>
                <option value="banking">Mobile Banking</option>
            </select>
            <button class = "submit-banhang">Gửi</button>
        </div>
    </div>
    <style>
        .thunghang label{
            
            font-weight: 500;
        }
        .thunghang input, .thunghang kk, .thunghang .modal-payment{
            margin-top: 15px;
            border-radius: 10px;
            border: 2px solid #ccc;
        }
        .thunghang .modal-payment{
            margin-bottom: 13px;
            padding: 10px;
        }
        .thunghang button{
            padding: 10px;
            margin: 0 auto;
            width: 30%;
            background-color: yellow;
        }
        .thunghang{
            width: 40%;
            background-color: white;
            border: 2px solid #ccc;
            min-height: 280px;
            display: flex;
            flex-direction: column;
            
        }
        .modal-banhang{
            
            position: fixed;
            top: 0;
            right: 0;
            left: 0;
            bottom: 0;
            background-color: rgba(0,0,0,0.5);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .an {
            display:none
        }
    </style>
    <script src="./js/slider.js"></script>
    <script src="./js/muahang.js"></script>
</body>
