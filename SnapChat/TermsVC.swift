//
//  TermsVC.swift
//  SnapChat
//
//  Created by Özcan on 29.07.2024.
//

import UIKit

class TermsVC: UIViewController {
    
    let texViewDeneme = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        
        texViewDeneme.text = "Uygulamamızı tekrar çalıştırdığımızda ve text üzerine tıkladığımızda klavyemizin açıldığını görebiliyoruz. Ayrıca, text alanının dışında bir yere tıkladığımızda da klavyemizin kapandığını görebiliyoruz. Süper! İlerleme kaydetmeye devam ediyoruz. Şimdi ise textimize efekt verebileceğimiz önemli bir eleman olan UITextViewDelegate elamanını kullanalım!Nedir?       Delegate,nesnelerine düzenlemeler yapabilmek için kullanılan bir yöntemidir. KullanımıViewController.swift dosyamızda kodlamaya devam ederek kullanacağız. ViewController classının içine “,” koyduktan sonra “UITextViewDelegate” yazarak elemanımızı aktif hale getirmiş olacağız. Artık text üzerinde değişiklikler yapabiliriz.Öncelikle, textimizi düzenlemek için dokunduğumuzda text alanımızın daha görünür bir hale gelebilmesi için backgrounda renklendirme verebiliriz. Bunu şu şekilde kodlayabiliriz. fonksiyonunu içerisine şu kodu ekleyelim. Ardından textimizi düzenlemeye başlarken oluşması gereken background rengini tanımlamak için touchesBegan fonksiyonunun altına yeni bir fonksiyon oluşturalım.Text düzenlememiz bittikten sonra düzenlemeden çıktığımızda text background renginin eski beyaz rengine dönmesi için yeniden bir fonksiyon oluşturalım!Yazı alanına random şekilde yazmaya devam edin, farkedeceksiniz ki 150 karakterden fazla karakteri istesek de yazamıyoruz.Uygulamamızı tekrar çalıştırdığımızda ve text üzerine tıkladığımızda klavyemizin açıldığını görebiliyoruz. Ayrıca, text alanının dışında bir yere tıkladığımızda da klavyemizin kapandığını görebiliyoruz. Süper! İlerleme kaydetmeye devam ediyoruz. Şimdi ise textimize efekt verebileceğimiz önemli bir eleman olan UITextViewDelegate elamanını kullanalım!Nedir?       Delegate,nesnelerine düzenlemeler yapabilmek için kullanılan bir yöntemidir. KullanımıViewController.swift dosyamızda kodlamaya devam ederek kullanacağız. ViewController classının içine “,” koyduktan sonra “UITextViewDelegate” yazarak elemanımızı aktif hale getirmiş olacağız. Artık text üzerinde değişiklikler yapabiliriz.Öncelikle, textimizi düzenlemek için dokunduğumuzda text alanımızın daha görünür bir hale gelebilmesi için backgrounda renklendirme verebiliriz. Bunu şu şekilde kodlayabiliriz. fonksiyonunu içerisine şu kodu ekleyelim. Ardından textimizi düzenlemeye başlarken oluşması gereken background rengini tanımlamak için touchesBegan fonksiyonunun altına yeni bir fonksiyon oluşturalım.Text düzenlememiz bittikten sonra düzenlemeden çıktığımızda text background renginin eski beyaz rengine dönmesi için yeniden bir fonksiyon oluşturalım!Yazı alanına random şekilde yazmaya devam edin, farkedeceksiniz ki 150 karakterden fazla karakteri istesek de yazamıyoruz.Uygulamamızı tekrar çalıştırdığımızda ve text üzerine tıkladığımızda klavyemizin açıldığını görebiliyoruz. Ayrıca, text alanının dışında bir yere tıkladığımızda da klavyemizin kapandığını görebiliyoruz. Süper! İlerleme kaydetmeye devam ediyoruz. Şimdi ise textimize efekt verebileceğimiz önemli bir eleman olan UITextViewDelegate elamanını kullanalım!Nedir?  BURAYA TIKLAYINIZ...     Delegate,nesnelerine düzenlemeler yapabilmek için kullanılan bir yöntemidir. KullanımıViewController.swift dosyamızda kodlamaya devam ederek kullanacağız. ViewController classının içine “,” koyduktan sonra “UITextViewDelegate” yazarak elemanımızı aktif hale getirmiş olacağız. Artık text üzerinde değişiklikler yapabiliriz.Öncelikle, textimizi düzenlemek için dokunduğumuzda text alanımızın daha görünür bir hale gelebilmesi için backgrounda renklendirme verebiliriz. Bunu şu şekilde kodlayabiliriz. fonksiyonunu içerisine şu kodu ekleyelim. Ardından textimizi düzenlemeye başlarken oluşması gereken background rengini tanımlamak için touchesBegan fonksiyonunun altına yeni bir fonksiyon oluşturalım.Text düzenlememiz bittikten sonra düzenlemeden çıktığımızda text background renginin eski beyaz rengine dönmesi için yeniden bir fonksiyon oluşturalım!Yazı alanına random şekilde yazmaya devam edin, farkedeceksiniz ki 150 karakterden fazla karakteri istesek de yazamıyoruz.Uygulamamızı tekrar çalıştırdığımızda ve text üzerine tıkladığımızda klavyemizin açıldığını görebiliyoruz. Ayrıca, text alanının dışında bir yere tıkladığımızda da klavyemizin kapandığını görebiliyoruz. Süper! İlerleme kaydetmeye devam ediyoruz. Şimdi ise textimize efekt verebileceğimiz önemli bir eleman olan UITextViewDelegate elamanını kullanalım!Nedir?       Delegate,nesnelerine düzenlemeler yapabilmek için kullanılan bir yöntemidir. KullanımıViewController.swift dosyamızda kodlamaya devam ederek kullanacağız. ViewController classının içine “,” koyduktan sonra “UITextViewDelegate” yazarak elemanımızı aktif hale getirmiş olacağız. Artık text üzerinde değişiklikler yapabiliriz.Öncelikle, textimizi düzenlemek için dokunduğumuzda text alanımızın daha görünür bir hale gelebilmesi için backgrounda renklendirme verebiliriz. Bunu şu şekilde kodlayabiliriz. fonksiyonunu içerisine şu kodu ekleyelim. Ardından textimizi düzenlemeye başlarken oluşması gereken background rengini tanımlamak için touchesBegan fonksiyonunun altına yeni bir fonksiyon oluşturalım.Text düzenlememiz bittikten sonra düzenlemeden çıktığımızda text background renginin eski beyaz rengine dönmesi için yeniden bir fonksiyon oluşturalım!Yazı alanına random şekilde yazmaya devam edin, farkedeceksiniz ki 150 karakterden fazla karakteri istesek de yazamıyoruz."
        
        texViewDeneme.layer.borderWidth = 1
        texViewDeneme.layer.cornerRadius = 12
//        texViewDeneme.isEditable = true
        texViewDeneme.isScrollEnabled = true
        texViewDeneme.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        texViewDeneme.textAlignment = .left
        view.addSubview(texViewDeneme)
        texViewDeneme.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            texViewDeneme.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            texViewDeneme.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            texViewDeneme.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
            texViewDeneme.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5)
        ])
    }
    

}
