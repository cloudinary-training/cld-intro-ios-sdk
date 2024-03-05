//
//  OptimizationViewController.swift
//  Cloudinary_Academy_App
//
//  Created by Adi Mizrahi on 18/09/2023.
//

import Foundation
import UIKit
import Cloudinary

class OptimizationViewController: UIViewController {
    @IBOutlet weak var vwBack: UIView!
    @IBOutlet weak var lbOriginal: UILabel!
    @IBOutlet weak var lbOptimized: UILabel!
    @IBOutlet weak var ivOriginal: CLDUIImageView!
    @IBOutlet weak var ivOptimized: CLDUIImageView!


    @IBOutlet weak var lbOriginalFormat: UILabel!
    @IBOutlet weak var lbOriginalDimensions: UILabel!
    @IBOutlet weak var lbOriginalSize: UILabel!

    @IBOutlet weak var lbOptimizedFormat: UILabel!
    @IBOutlet weak var lbOptimizedDimensions: UILabel!
    @IBOutlet weak var lbOptimizedSize: UILabel!

    var type: OptimizationViewType = .Optimization

    var publicId: String = "Demo%20app%20content/optimization_optimized"

    var cloudinary = CloudinaryHelper.shared.cloudinary

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setOriginalImageView()
        setOptimizedImageView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if type != .PreProcess {
            loadImageData()
        }
    }

    func setBackButton() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(stepBack))
        vwBack.addGestureRecognizer(gesture)
    }

    func setOriginalImageView() {
        var url = cloudinary.createUrl().generate(publicId)
        switch type {
        case .FetchUpload:
            url = cloudinary.createUrl().setType("fetch").generate(publicId)
            ivOriginal.cldSetImage(url!, cloudinary: cloudinary)
        case .Optimization:
            url = cloudinary.createUrl().generate(publicId)
            ivOriginal.cldSetImage(url!, cloudinary: cloudinary)
        case .PreProcess:
            ivOriginal.image = UIImage(named: "yellow_car")
        }


        lbOriginalFormat.isHidden = true
        lbOriginalDimensions.isHidden = true
        lbOriginalSize.isHidden = true

    }

    func setOptimizedImageView() {
        var url: String!
        switch type {
        case .Optimization:
            url = cloudinary.createUrl().setTransformation(CLDTransformation().setQuality("auto").setFetchFormat("heic").setDpr("auto").setWidth(0.8).setCrop("scale")).generate(publicId)
            ivOptimized.cldSetImage(url!, cloudinary: cloudinary)
        case .FetchUpload:
            url = cloudinary.createUrl().setType("fetch").setTransformation(CLDTransformation().setQuality("auto").setFetchFormat("heic").setDpr("auto").setWidth(0.8).setCrop("scale")).generate(publicId)
            ivOptimized.cldSetImage(url!, cloudinary: cloudinary)
        case .PreProcess:
            let preprocessChain = CLDImagePreprocessChain()
                .addStep(CLDPreprocessHelpers.limit(width: 500, height: 500))
                .addStep(CLDPreprocessHelpers.rotate(degrees: 0))
                .addStep(CLDPreprocessHelpers.dimensionsValidator(minWidth: 10, maxWidth: 500, minHeight: 10, maxHeight: 500))
                .setEncoder(CLDPreprocessHelpers.customImageEncoder(format: EncodingFormat.PNG, quality: 70))
            cloudinary.createUploader().upload(
                data: UIImage(named: "yellow_car")!.pngData()!, uploadPreset: "ios_sample", preprocessChain: preprocessChain) { (progress) in
                    // Handle progress
              } completionHandler: { (image, error) in
                  self.ivOptimized.cldSetImage(publicId: (image?.publicId!)!, cloudinary: self.cloudinary)
                  self.publicId = image!.publicId!
                  self.loadImageData()
              }
        }
        lbOptimizedFormat.isHidden = true
        lbOptimizedDimensions.isHidden = true
        lbOptimizedSize.isHidden = true
    }

    @objc func loadImageData() {
        var originalUrl: String!
        var optimizedUrl: String!

        switch type {
        case .Optimization:
            originalUrl = cloudinary.createUrl().generate(publicId)!
            optimizedUrl = cloudinary.createUrl().setTransformation(CLDTransformation().setQuality("auto").setFetchFormat("heic").setDpr("auto").setWidth(0.8).setCrop("scale")).generate(publicId)!
        case .FetchUpload:
            originalUrl = cloudinary.createUrl().setType("fetch").generate(publicId)!
            optimizedUrl = cloudinary.createUrl().setType("fetch").setTransformation(CLDTransformation().setQuality("auto").setFetchFormat("heic").setDpr("auto").setWidth(0.8).setCrop("scale")).generate(publicId)!
        case .PreProcess:
            originalUrl = cloudinary.createUrl().generate("gfynghsdjtgmznwx1t0d")!
            optimizedUrl = cloudinary.createUrl().generate(publicId)
        }
        FileUtils.getImageInfo(URL(string: originalUrl)!) { format,size, dimensions  in
            self.lbOriginalFormat.text = "\(format.uppercased()) ⏺"
            self.lbOriginalDimensions.text = "\(Int(dimensions.width))x\(Int(dimensions.height)) ⏺"
            self.lbOriginalSize.text = "\(size)MB"

            self.lbOriginalFormat.isHidden = false
            self.lbOriginalDimensions.isHidden = false
            self.lbOriginalSize.isHidden = false
        }
        FileUtils.getImageInfo(URL(string: optimizedUrl)!) { format, size, dimensions in
            self.lbOptimizedFormat.text = "\(format.uppercased()) ⏺"
            self.lbOptimizedDimensions.text = "\(Int(dimensions.width))x\(Int(dimensions.height)) ⏺"
            self.lbOptimizedSize.text = "\(size)MB"

            self.lbOptimizedFormat.isHidden = false
            self.lbOptimizedDimensions.isHidden = false
            self.lbOptimizedSize.isHidden = false
        }
    }

    @objc func stepBack() {
        self.dismiss(animated: true)
    }
}
