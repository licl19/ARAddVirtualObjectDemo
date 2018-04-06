//
//  ARSCNViewViewController.swift
//  ARAddVirtualObjectDemo
//
//  Created by lichanglai on 2018/4/6.
//  Copyright © 2018年 sankai. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARSCNViewViewController: UIViewController {
    lazy var arSCNView: ARSCNView = {
        let scnViewTmp = ARSCNView(frame: view.bounds)
        scnViewTmp.session = arSession
        scnViewTmp.automaticallyUpdatesLighting = true
        return scnViewTmp
    }()
    lazy var arSession: ARSession = {
        let sessionTmp = ARSession()
        return sessionTmp
    }()
    lazy var arSessionConfiguration: ARWorldTrackingConfiguration = {
        let configurationTmp = ARWorldTrackingConfiguration()
        configurationTmp.planeDetection = ARWorldTrackingConfiguration.PlaneDetection.horizontal
        configurationTmp.isLightEstimationEnabled = true
        return configurationTmp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        view.addSubview(arSCNView)
        arSession.run(arSessionConfiguration, options: ARSession.RunOptions.removeExistingAnchors)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //1.使用场景加载scn文件（scn格式文件是一个基于3D建模的文件，使用3DMax软件可以创建，这里系统有一个默认的3D飞机）--------在右侧我添加了许多3D模型，只需要替换文件名即可
        let scene = SCNScene.init(named: "Models.scnassets/ship.scn")
        //2.获取飞机节点（一个场景会有多个节点，此处我们只写，飞机节点则默认是场景子节点的第一个）
        //所有的场景有且只有一个根节点，其他所有节点都是根节点的子节点
        let shipNode = scene?.rootNode.childNodes[0]
        //3.将飞机节点添加到当前屏幕中
        arSCNView.scene.rootNode.addChildNode(shipNode!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
