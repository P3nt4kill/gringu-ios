//
//  LastSessionsViewModel.swift
//  Gringu
//
//  Created by Thiago Ricieri on 19/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

class LastSessionsViewModel: BaseViewModel {
  
  var sessions: [GringuSession] {
    
    let sessionParis = GringuSession(name: "Paris 19/08", photos: [
      GringuPhoto(url: "https://lalarebelo.com/wp-content/uploads/2014/10/01-PASSEIO-01-Louvre-museu-e-piramides-dicas-o-que-fazer-em-paris-roteiros-de-viagem-1024x768.jpg"),
      GringuPhoto(url: "https://abrilviagemeturismo.files.wordpress.com/2016/11/thinkstockphotos-4549879531.jpeg?quality=70&strip=info&w=680&h=453&crop=1"),
      GringuPhoto(url: "http://www.casablanca.tur.br/blog/wp-content/uploads/2011/09/Fotolia_20755221_Subscription_XL-700x456.jpg"),
      GringuPhoto(url: "http://f.i.uol.com.br/folha/turismo/images/15077230.jpeg"),
      GringuPhoto(url: "https://manuluize.com/wp-content/uploads/2014/02/Look-do-dia-Torre-Eiffel-Paris-Inverno-2014-blog-moda-manu-luize-curitiba.jpg")
    ])
    let sessionCuritiba = GringuSession(name: "Paris 12/08", photos: [
      GringuPhoto(url: "http://specialparana.com/wp-content/uploads/2016/05/igor-turismo-em-curitiba.png"),
      GringuPhoto(url: "http://www.babytour.com.br/imagens/servicos-turismo-viagens/turismo-em-curitiba01_g.jpg"),
      GringuPhoto(url: "http://specialparana.com/wp-content/uploads/2013/09/museu-oscar-niemeyer-mon-curitiba-turismo.jpg")
    ])
    let sessionBerlin = GringuSession(name: "Berlin 10/08", photos: [
      GringuPhoto(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvBMm4zWXwfcC-y9mVLfE-rZpbzL49KCcctwTV7sKf9hyMJGBj"),
      GringuPhoto(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4_CPpCqSgDkEAH1Uj5nSIFFUSrlh2_G8gZxwb36G41um4Jg1l"),
      GringuPhoto(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL3Dp7F1XNw3YflAx9ylxRIn3Fmte8VFfRd39a3-bnJPdwKVPX")
    ])
    
    return [ sessionParis, sessionCuritiba, sessionBerlin ]
  }
}
