//
//  HeroHeaderUIView.swift
//  netflix
//
//  Created by halil yılmaz on 29.04.2022.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let myListButton: UIButton = {
        let button = UIButton()
        button.setTitle("My List", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button .translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button .translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let informationButton: UIButton = {
        let button = UIButton()
        button.setTitle("info", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button .translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "strangerThings")
        return imageView
    }()
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(informationButton)
        addSubview(myListButton)
        applyConstrains()
    }
    
    private func applyConstrains(){
        
        let myListButtonConstraints = [
            myListButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            myListButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            myListButton.widthAnchor.constraint(equalToConstant: 60)
        ]
        
        let playButtonConstraints = [
            //playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 80)
            
        ]
        
        
        let informationButtonConstraints = [
            informationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            informationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            informationButton.widthAnchor.constraint(equalToConstant: 60)
        ]
        
       
        
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(informationButtonConstraints)
        NSLayoutConstraint.activate(myListButtonConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterUrl)") else {return}
        heroImageView.sd_setImage(with: url, completed: nil)
    }
    
   
       
     
       
      

}
