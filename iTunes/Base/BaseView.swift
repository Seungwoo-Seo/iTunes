//
//  BaseView.swift
//  iTunes
//
//  Created by 서승우 on 2023/11/10.
//

import UIKit
import SnapKit

class BaseView: UIView, Base {

    override init(frame: CGRect) {
        super.init(frame: frame)

        initialAttributes()
        initialHierarchy()
        initialLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initialAttributes() {}

    func initialHierarchy() {}

    func initialLayout() {}

}
