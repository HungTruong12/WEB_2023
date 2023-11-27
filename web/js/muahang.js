const buyBtns = document.querySelectorAll('.item-list__img--option-link')

for (let buyBtn of buyBtns){
    buyBtn.addEventListener('click', (e) => {
        e.preventDefault();
        let modal = document.querySelector('.modal-banhang')
        let userEmail = document.querySelector('.user-email')
        
        const clickedId = buyBtn.id;
        console.log('Clicked ID:', clickedId);
        
        const dong  = document.querySelector('.dong')
        dong.addEventListener('click', ()=>{
            modal.classList.add('an')
        })
        
        if (userEmail.textContent == '') alert('Hãy đăng nhập trước!')
        else {
            modal.classList.remove("an")
        
            const parentDiv = e.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode

            let tenSanPham = parentDiv.querySelector('.item-list__description-title').textContent.trim()
            let giaTien = parentDiv.querySelector('.item-list__price-num').textContent.trim()
            giaTien = giaTien.substring(0, giaTien.length - 4).trim()

            console.log(tenSanPham)
            console.log(giaTien)

            const submitBanHang = document.querySelector('.submit-banhang')
            submitBanHang.addEventListener('click', (e)=>{
                e.preventDefault()
                console.log('Submit')
                var phone = document.querySelector('.modal-phone').value;
                var address = document.querySelector('.modal-address').value;
                var quantity = document.querySelector('.modal-quantity').value;
                var paymentMethod = document.querySelector('.modal-payment').value;
//                let data = JSON.stringify({
//                    "tenSanPham": tenSanPham,
//                    "giaTien": giaTien,
//                    "phone": document.querySelector('.modal-phone').value,
//                    "address": document.querySelector('.modal-address').value,
//                    "quantity": document.querySelector('.modal-quantity').value,
//                    "paymentMethod": document.querySelector('.modal-payment').value
//                })
                
                fetch(`http://localhost:9999/d20btlweb/ProcessDatHang?tenSanPham=${tenSanPham}&giaTien=${giaTien}&phone=${phone}&address=${address}&quantity=${quantity}&paymentMethod=${paymentMethod}`, {
                    method: 'Post'
                })
//                console.log(data)
//
//                let xhr = new XMLHttpRequest()
//                xhr.open('POST', 'http://localhost:9999/d20btlweb/ProcessDatHang', true)
//                xhr.setRequestHeader('Content-Type', 'application/json')
//                xhr.onreadystatechange = function() {
//                    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
//                        // Xử lý phản hồi từ server.
//                        console.log('heheh')
//                    }
//                };
//                xhr.send(data)
                alert('Sucessfully!')
                document.querySelector('.modal-phone').value = ""
                document.querySelector('.modal-address').value = ""
                modal.classList.add('an')
            })
        }
        
    })
}