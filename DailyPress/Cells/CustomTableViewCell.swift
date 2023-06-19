//
//  CustomTableViewCell.swift
//  DailyPress
//
//  Created by Kadirhan Keles on 18.06.2023.
//

import UIKit
import SnapKit
class CustomTableViewCell: UITableViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        //view.layer.borderWidth = 0.5
        //view.layer.borderColor = UIColor.black.cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.2
        view.layer.cornerRadius = 10.0
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.5
        return label
    }()
    let descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 5
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        return label
    }()
    
    let newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var newsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        
        contentView.addSubview(containerView)
        containerView.addSubview(newsStackView)
        containerView.addSubview(newsImage)

        
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        newsStackView.snp.makeConstraints { make in
            make.top.left.equalTo(containerView).offset(5)
            make.bottom.equalTo(containerView).offset(-5)
            make.right.equalTo(newsImage.snp.left).offset(-10)
        }
        
        newsImage.snp.makeConstraints { make in
            make.top.equalTo(containerView).offset(10)
            make.right.bottom.equalTo(containerView).offset(-10)
            make.width.equalTo(containerView.snp.width).multipliedBy(0.35)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
        }

        
        newsStackView.addArrangedSubview(titleLabel)
        newsStackView.addArrangedSubview(descLabel)
    }
    
}
