//
//  TermsVC.swift
//  SnapChat
//
//  Created by Özcan on 29.07.2024.
//

import UIKit
import WebKit

class TermsVC: UIViewController,WKUIDelegate {
    
//    let texViewDeneme = UITextView()
    var webView : WKWebView!
    
    
//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
//        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismisDoneButton))
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: view.bounds, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        
        let myUrl = URL(string: "https://medium.com")
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
    
    
    @objc func dismisDoneButton() {
        self.dismiss(animated: true)
    }
//
//        let text1 = "Uygulamamızı tekrar çalıştırdığımızda ve text üzerine tıkladığımızda klavyemizin açıldığını görebiliyoruz. Ayrıca, text alanının dışında bir yere tıkladığımızda da klavyemizin kapandığını görebiliyoruz. Süper! İlerleme kaydetmeye devam ediyoruz. Şimdi ise textimize efekt verebileceğimiz önemli bir eleman olan UITextViewDelegate elamanını kullanalım!Nedir?       Delegate,nesnelerine düzenlemeler yapabilmek için kullanılan bir yöntemidir. KullanımıViewController.swift dosyamızda kodlamaya devam ederek kullanacağız. ViewController classının içine “,” koyduktan sonra “UITextViewDelegate” yazarak elemanımızı aktif hale getirmiş olacağız. Artık text üzerinde değişiklikler yapabiliriz.Öncelikle, textimizi düzenlemek için dokunduğumuzda text alanımızın daha görünür bir hale gelebilmesi için backgrounda renklendirme verebiliriz. Bunu şu şekilde kodlayabiliriz. fonksiyonunu içerisine şu kodu ekleyelim. Ardından textimizi düzenlemeye başlarken oluşması gereken background rengini tanımlamak için touchesBegan fonksiyonunun altına yeni bir fonksiyon oluşturalım.Text düzenlememiz bittikten sonra düzenlemeden çıktığımızda text background renginin eski beyaz rengine dönmesi için yeniden bir fonksiyon oluşturalım!Yazı alanına random şekilde yazmaya devam edin, farkedeceksiniz ki 150 karakterden fazla karakteri istesek de yazamıyoruz.Uygulamamızı tekrar çalıştırdığımızda ve text üzerine tıkladığımızda klavyemizin açıldığını görebiliyoruz. Ayrıca, text alanının dışında bir yere tıkladığımızda da klavyemizin kapandığını görebiliyoruz. Süper! İlerleme kaydetmeye devam ediyoruz. Şimdi ise textimize efekt verebileceğimiz önemli bir eleman olan UITextViewDelegate elamanını kullanalım!Nedir?       Delegate,nesnelerine düzenlemeler yapabilmek için kullanılan bir yöntemidir. KullanımıViewController.swift dosyamızda kodlamaya devam ederek kullanacağız. ViewController classının içine “,” koyduktan sonra “UITextViewDelegate” yazarak elemanımızı aktif hale getirmiş olacağız. Artık text üzerinde değişiklikler yapabiliriz.Öncelikle, textimizi düzenlemek için dokunduğumuzda text alanımızın daha görünür bir hale gelebilmesi için backgrounda renklendirme verebiliriz. Bunu şu şekilde kodlayabiliriz. fonksiyonunu içerisine şu kodu ekleyelim. Ardından textimizi düzenlemeye başlarken oluşması gereken background rengini tanımlamak için touchesBegan fonksiyonunun altına yeni bir fonksiyon oluşturalım.Text düzenlememiz bittikten sonra düzenlemeden çıktığımızda text background renginin eski beyaz rengine dönmesi için yeniden bir fonksiyon oluşturalım!Yazı alanına random şekilde yazmaya devam edin, farkedeceksiniz ki 150 karakterden fazla karakteri istesek de yazamıyoruz.Uygulamamızı tekrar çalıştırdığımızda ve text üzerine tıkladığımızda klavyemizin açıldığını görebiliyoruz. Ayrıca, text alanının dışında bir yere tıkladığımızda da klavyemizin kapandığını görebiliyoruz. Süper! İlerleme kaydetmeye devam ediyoruz. Şimdi ise textimize efekt verebileceğimiz önemli bir eleman olan UITextViewDelegate elamanını kullanalım!Nedir?  BURAYA TIKLAYINIZ...     Delegate,nesnelerine düzenlemeler yapabilmek için kullanılan bir yöntemidir. KullanımıViewController.swift dosyamızda kodlamaya devam ederek kullanacağız. ViewController classının içine “,” koyduktan sonra “UITextViewDelegate” yazarak elemanımızı aktif hale getirmiş olacağız. Artık text üzerinde değişiklikler yapabiliriz.Öncelikle, textimizi düzenlemek için dokunduğumuzda text alanımızın daha görünür bir hale gelebilmesi için backgrounda renklendirme verebiliriz. Bunu şu şekilde kodlayabiliriz. fonksiyonunu içerisine şu kodu ekleyelim. Ardından textimizi düzenlemeye başlarken oluşması gereken background rengini tanımlamak için touchesBegan fonksiyonunun altına yeni bir fonksiyon oluşturalım.Text düzenlememiz bittikten sonra düzenlemeden çıktığımızda text background renginin eski beyaz rengine dönmesi için yeniden bir fonksiyon oluşturalım!Yazı alanına random şekilde yazmaya devam edin, farkedeceksiniz ki 150 karakterden fazla karakteri istesek de yazamıyoruz.Uygulamamızı tekrar çalıştırdığımızda ve text üzerine tıkladığımızda klavyemizin açıldığını görebiliyoruz. Ayrıca, text alanının dışında bir yere tıkladığımızda da klavyemizin kapandığını görebiliyoruz. Süper! İlerleme kaydetmeye devam ediyoruz. Şimdi ise textimize efekt verebileceğimiz önemli bir eleman olan UITextViewDelegate elamanını kullanalım!Nedir?       Delegate,nesnelerine düzenlemeler yapabilmek için kullanılan bir yöntemidir. KullanımıViewController.swift dosyamızda kodlamaya devam ederek kullanacağız. ViewController classının içine “,” koyduktan sonra “UITextViewDelegate” yazarak elemanımızı aktif hale getirmiş olacağız. Artık text üzerinde değişiklikler yapabiliriz.Öncelikle, textimizi düzenlemek için dokunduğumuzda text alanımızın daha görünür bir hale gelebilmesi için backgrounda renklendirme verebiliriz. Bunu şu şekilde kodlayabiliriz. fonksiyonunu içerisine şu kodu ekleyelim. Ardından textimizi düzenlemeye başlarken oluşması gereken background rengini tanımlamak için touchesBegan fonksiyonunun altına yeni bir fonksiyon oluşturalım.Text düzenlememiz bittikten sonra düzenlemeden çıktığımızda text background renginin eski beyaz rengine dönmesi için yeniden bir fonksiyon oluşturalım!Yazı alanına random şekilde yazmaya devam edin, farkedeceksiniz ki 150 karakterden fazla karakteri istesek de yazamıyoruz."
//        
//        texViewDeneme.text = text1
//        texViewDeneme.layer.borderWidth = 1
//        texViewDeneme.layer.cornerRadius = 12
//        
////        texViewDeneme.isEditable = true
//        texViewDeneme.isScrollEnabled = true
//        texViewDeneme.font = UIFont.systemFont(ofSize: 12, weight: .medium)
//        texViewDeneme.textAlignment = .left
//        
//        let mutableAttributedString = NSMutableAttributedString(string: text1)
//        let linkRange = (mutableAttributedString.string as NSString).range(of: "BURAYA TIKLAYINIZ...")
//        
//        mutableAttributedString.addAttribute(.link, value: "https://github.com/", range: linkRange)
//        
//        texViewDeneme.attributedText = mutableAttributedString
//        
//        texViewDeneme.textColor = UIColor.black
//        texViewDeneme.linkTextAttributes = [.foregroundColor:UIColor.blue]
//        
//        
//        view.addSubview(texViewDeneme)
//        texViewDeneme.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            texViewDeneme.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
//            texViewDeneme.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            texViewDeneme.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
//            texViewDeneme.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5)
//        ])
   
}
