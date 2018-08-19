//
//  GringuViewController.swift
//  Gringu
//
//  Created by Thiago Ricieri on 18/08/18.
//  Copyright © 2018 P3NT4K1LL¡. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import CoreLocation
import MapKit

class GringuViewController: UIViewController,
    CLLocationManagerDelegate,
    MKMapViewDelegate {
  
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var containerViewBottomConstraint: NSLayoutConstraint!
  @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!
  @IBOutlet weak var mapView: MKMapView!
  
  private var activeViewController: UIViewController!
  private let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
    centerUserLocation()
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      self.presentContainerViewFirstTime()
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mainStore.subscribe(self)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    mainStore.unsubscribe(self)
  }
  
  @IBAction func actionShowSessions(_ sender: Any) {
    self.performSegue(withIdentifier: "toSessions", sender: nil)
  }
}

// MARK: -
extension GringuViewController {
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    guard let annotation = annotation as? GringuAnnotation else {
      return nil
    }
    
    var dequedView = mapView.dequeueReusableAnnotationView(withIdentifier: GringuAnnotation.identifier)
        as? MKMarkerAnnotationView
    
    if dequedView == nil {
      dequedView = MKMarkerAnnotationView(annotation: annotation,
                                          reuseIdentifier: GringuAnnotation.identifier)
    }
    
    dequedView!.markerTintColor = UIColor.blue
    dequedView!.clusteringIdentifier = GringuAnnotation.identifier
    
    return dequedView
  }
}

// MARK: -
extension GringuViewController {
  
  private func placeMarkers(_ markers: [MKAnnotation]) {
    mapView.addAnnotations(markers)
  }
  
  private func centerUserLocation() {
    self.locationManager.requestWhenInUseAuthorization()
    
    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.startUpdatingLocation()
    }
    
    mapView.delegate = self
    mapView.mapType = .standard
    mapView.isZoomEnabled = true
    mapView.isScrollEnabled = true
    
    if let coor = mapView.userLocation.location?.coordinate{
      mapView.setCenter(coor, animated: true)
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let locValue:CLLocationCoordinate2D = manager.location!.coordinate
    
    mapView.mapType = MKMapType.standard
    
    let span = MKCoordinateSpanMake(0.05, 0.05)
    let region = MKCoordinateRegion(center: locValue, span: span)
    mapView.setRegion(region, animated: true)
    
    let annotation = MKPointAnnotation()
    annotation.coordinate = locValue
    annotation.title = "Você!"
    annotation.subtitle = "Localização atual"
    mapView.addAnnotation(annotation)
    
    locationManager.stopUpdatingLocation()
  }
}

extension GringuViewController {
  
  func selectedServiceState(_ state: AppState) {
    let nextViewController = createViewController("reviewOrder")
    displayContentController(content: nextViewController)
    activeViewController = nextViewController
    hideContainerView({ _ in })
  }
  
  func placeOrderState(_ state: AppState) {
    let nextViewController = createViewController("placeOrder")
    hideContentController(content: activeViewController)
    displayContentController(content: nextViewController)
    activeViewController = nextViewController
  }
  
  func waitingForAssistantState(_ state: AppState) {
    let nextViewController = createViewController("assistantFound")
    hideContentController(content: activeViewController)
    displayContentController(content: nextViewController)
    activeViewController = nextViewController
  }
  
  func serviceInProgressState(_ state: AppState) {
    let nextViewController = createViewController("serviceInProgress")
    hideContentController(content: activeViewController)
    displayContentController(content: nextViewController)
    activeViewController = nextViewController
  }
  
  func serviceEndedState(_ state: AppState) {
    let nextViewController = createViewController("rateAssistant")
    hideContentController(content: activeViewController)
    displayContentController(content: nextViewController)
    activeViewController = nextViewController
  }
  
  func idleState(_ state: AppState) {
    hideContentController(content: activeViewController)
    displayContainerView({ _ in })
  }
}

// MARK: -
extension GringuViewController {
  private func presentContainerViewFirstTime() {
    UIView.animate(
      withDuration: ViewConfig.fadeInTime,
      animations: {
        self.containerViewBottomConstraint.constant = ViewConfig.containerViewBottomVisible
        self.menuLeadingConstraint.constant = ViewConfig.menuLeadingVisible
        self.view.layoutIfNeeded()
      },
      completion: { _ in })
  }
  private func hideContainerView(_ completed: @escaping (Bool) -> Void) {
    UIView.animate(
      withDuration: ViewConfig.fadeInTimeSlow,
      animations: {
        self.containerView.alpha = 0.4
        self.containerViewBottomConstraint.constant = ViewConfig.containerViewBottomHidden
        self.menuLeadingConstraint.constant = ViewConfig.menuLeadingHidden
        self.view.layoutIfNeeded()
      },
      completion: completed)
  }
  private func displayContainerView(_ completed: @escaping (Bool) -> Void) {
    UIView.animate(
      withDuration: ViewConfig.fadeOutTime,
      animations: {
        self.containerView.alpha = 1
        self.containerViewBottomConstraint.constant = ViewConfig.containerViewBottomVisible
        self.menuLeadingConstraint.constant = ViewConfig.menuLeadingVisible
      },
      completion: completed)
  }
}

// MARK: -
extension GringuViewController: StoreSubscriber {
  typealias StoreSubscriberStateType = AppState
  
  func newState(state: AppState) {
    switch state.journey {
    case .idle: idleState(state)
    case .selectedService: selectedServiceState(state)
    case .placedOrder: placeOrderState(state)
    case .waitingForAssistant: waitingForAssistantState(state)
    case .serviceInProgress: serviceInProgressState(state)
    case .serviceEnded: serviceEndedState(state)
    default: break
    }
  }
}

extension GringuViewController {
  func displayContentController(content: UIViewController) {
    addChildViewController(content)
    self.view.addSubview(content.view)
    
    if let vc = content as? IdealViewBoundsProvider {
      content.view.frame = vc.idealViewBounds(self.view.frame)
    }
    if let vc = content as? Appearable {
      vc.appear(from: self.view.frame, completion: { } )
    }
  }
  
  func hideContentController(content: UIViewController) {
    if let vc = content as? Disappearable {
      vc.disappear(from: self.view.frame) {
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
      }
    }
    else {
      content.view.removeFromSuperview()
      content.removeFromParentViewController()
    }
  }
}
