//
//  horseTableViewControl.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by kpugame on 2021/05/23.
//

import UIKit

let horseTitles = ["서러브레드", "샤이어", "미니어처", "포니"]

var horseDes =  ["서러브레드종(Thoroughbred)은 현재 경주마의 거의 대부분을 차지하고 있으며, 오로지 경주마로서만 개량된 쿼터호스와 함께 세계에서 가장 빠르고 몸이 잘 발달된 세련된 품종이다. 17세기 영국에서 경주 능력이 우수한 말을 개량 발굴하기 위해 영국 재래 암말에 아랍 수말을 교배시켜 만든 품종으로, 300여 년간 경주 능력이 우수한 말끼리 교배시켜 번식해왔다. 작은 머리와 두툼한 가슴, 곧은 등을 가졌고, 다리는 길고 오랫동안 쉽게 걸을 수 있도록 짧은 뼈로 되어 있다. 특히 관절은 잘 발달되어 있다. 피부는 얇고 혈관이 비쳐 보인다. 눈은 커다랗게 둥글고 밝으며 귀는 약간 길고, 콧구멍은 크고 목은 곧고 가늘다. 엉덩이는 경사진 것도 있지만, 수평에 가까운 것이 많다. 털 색깔은 보통 적갈색이지만 극히 드물게는 검은색이나 회색인 것도 있으며 체고는 160 cm 내외 체중은 500 kg 전후다.", "샤이어(shire)는 영국 원산의 말 품종으로, 만마(輓馬), 즉 짐말으로 개량되었다. 현재는 삼림 순찰, 승마 등에도 이용된다. 털 빛깔은 대개 검은색이거나 회색, 갈색이다. 현존하는 말 품종 가운데 가장 거대한 크기를 가지고 있는데, 보통 어깨높이가 1.7m 이상이고 몸무게는 910kg를 넘는다. 키 1.9m에 몸무게 1.1t에 이르는 것도 있을 정도로 거대하다.샤이어는 서러브레드 같은 경주용 말과는 달리 무언가를 끄는 데에 적합하며 힘이 강하고 지구력이 높으며 성격이 온순하고 착하며 참을성이 좋다. 주로 마차, 짐마차를 끄는데에 많이 사용되었으며 농경시대에는 농사에도 많이 이용되었다. 또 술수레를 끄는 데도 한몫 했다고 한다. 워낙 힘이 강하다보니 힘이 약한 말의 경우 두세마리가 끌어야 할 정도의 중량을 혼자서 끌 정도로 대단한 힘을 가지고 있다. 원래 승용마로는 그다지 사용하지 않던 말이지만, 요즘에는 트럭 덕분에 화물 운송용 중종마 수요가 급감하면서 오히려 승용마로 더 많이 사용되는 편이다.반대로 귀찮거나 고집을 부리면서 움직이지 않으려고 하면 건장한 성인 몇 명이 달라붙어야 움직이게 할 수 있을 정도로 힘과 덩치가 대단하다.", "미니어처 말은 어깨까지의 높이가 34인치(86cm)보다 커서는 안 되기 때문에 작은 조랑말보다도 작다. 그리고 완전히 자란 후의 체중이 150~250파운드(68~113kg)여야 한다. 일부 미니어처 말은 조랑말처럼 보이기도 하지만, 미니어처 말 사육자의 최종 목표는 정말로 작은 말을 만드는 것이다. 즉, 외관은 일반 말과 동일하지만 크기는 미니어처 사이즈의 말을 원하는 것이다. 따라서 미니어처 말은 목이나 배가 두꺼워서는 안 되며, 다리도 완전히 짧아서도 안 된다.오늘날, 미니어처 말은 혈통 있는 말로 길러지고 있다. 미니어처 말 중에서도 클럽 호스 유형의 경우 넓은 가슴과 근육질의 다리를 가지고 있는 반면, 지능형은 앞머리가 약간 들어간 동그란 얼굴에 연약한 주둥이, 커다란 눈, 얇은 몸체를 가지고 있다.", "앞다리에서 발굽까지의 거리가 147cm미만인 말을 조랑말이라 한다. 대체로 조랑말은 갈기가 두껍고 털이 많으며 짧은 다리와 넓적한 몸통, 두꺼운 목, 그리고 몸에 비해 상대적으로 큰 머리를 가졌다. 또한 서식지의 기후와 풍토에 적응을 잘해 힘이 좋고 인내심이 강하다.야생상태에서 가축으로 길드여진 이후, 조랑말은 다양한 분야에서 인류에게 도움을 준다. 체구가 작은 것에 비해 힘과 지구력이 좋아 전쟁과 물자수송, 농경, 석탄 채굴, 우편배달 등에서 실력을 과시해 왔다.조랑말은 순치만 잘되면 사람과도 쉽게 친해지고 유순해지기 때문에 최근에는 재활승마 및 시각장애인 안내에서도 각광을 받고 있다."]

let horsename = ["thoroughbred", "shire", "miniature", "pony"]

let postImages = ["서러브레드", "샤이어", "미니어처", "포니"]
var myIndex = 0

class horseTableViewControl: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 258.0
        tableView.rowHeight = UITableView.automaticDimension

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horseTitles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! horseViewCell

        cell.horseImage.image = UIImage(named: postImages[(indexPath as NSIndexPath).row])
        cell.horseLabel.text = horseTitles[(indexPath as NSIndexPath).row]

        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let rotationAngleRadians = 90.0 * CGFloat(Double.pi/180.0)
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
        cell.layer.transform = rotationTransform
        
        UIView.animate(withDuration: 1.0, animations: { cell.layer.transform = CATransform3DIdentity })
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}
