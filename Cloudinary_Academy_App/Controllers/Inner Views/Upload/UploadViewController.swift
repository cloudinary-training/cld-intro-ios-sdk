//
//  UploadViewController.swift
//  Cloudinary_Academy_App
//
//  Created by Adi Mizrahi on 18/09/2023.
//

import Foundation
import UIKit
import Cloudinary

class UploadViewController: UIViewController {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var vwUpload: InnerUploadFrame!
    @IBOutlet weak var vwPreProcess: InnerUploadFrame!
    @IBOutlet weak var vwFetchUpload: InnerUploadFrame!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setViews()
    }

    private func setViews() {
        setUploadView()
        setPreProcessView()
        setFetchUploadView()
    }

    private func setUploadView() {
        vwUpload.setTitle(title: "Upload")
        vwUpload.setSubtitle(subtitle: "Everything starts when you upload a file")

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(uploadClicked))
        vwUpload.addGestureRecognizer(tapGesture)
    }

    private func setPreProcessView() {
        vwPreProcess.setTitle(title: "Pre Process Image")
        vwPreProcess.setSubtitle(subtitle: "Modify your image before upload")

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PreProcessClicked))
        vwPreProcess.addGestureRecognizer(tapGesture)
    }

    private func setFetchUploadView() {
        vwFetchUpload.setTitle(title: "Fetch Upload")
        vwFetchUpload.setSubtitle(subtitle: "Upload an image from any URL")

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(fetchUploadClicked))
        vwFetchUpload.addGestureRecognizer(tapGesture)
    }

    @objc private func uploadClicked() {
        if let controller = UIStoryboard(name: "Base", bundle: nil).instantiateViewController(identifier: "BaseViewController") as? BaseViewController {
            controller.type = .Upload
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }

    @objc private func PreProcessClicked() {
        if let controller = UIStoryboard(name: "Base", bundle: nil).instantiateViewController(identifier: "BaseViewController") as? BaseViewController {
            controller.type = .PreProcess
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }

    @objc private func fetchUploadClicked() {
        if let controller = UIStoryboard(name: "Base", bundle: nil).instantiateViewController(identifier: "BaseViewController") as? BaseViewController {
            controller.type = .FetchUpload
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }
}


