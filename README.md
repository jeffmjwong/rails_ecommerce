# README

Link to app: [riversite.xyz](riversite.xyz)

Link to GitHub repository: [https://github.com/jeffmjwong/rails_two_sided_market_place](https://github.com/jeffmjwong/rails_two_sided_market_place)

## 1. Summary
This web app is a two-sided marketplace project that was designed and built as one of Coder Academy's major assignments. The app is built end-to-end using Ruby on Rails framework. Third party APIs such as Stripe(payment system) and Gmail were utilised for some of the features in the app.

**Problem Definition**

Many modern e-commerce stores lack user-friendly interfaces and are thus difficult for new or beginner users to use. Navigation is sometimes a critical issue for some of these sites. Users also reported unwanted amount of ads and fear of security breach when using the major e-commerce sites. These lead to the need to create a simple to use and clean e-commerce store which provide excellent user experience and ease of use.

**Solution**

RiverSite is an e-commerce store which allows authenticated users to buy or sell items with the web app. Anonymous users are able to browse the app and buy items with a one-click payment feature as well, but they do not possess full features such as adding items to cart and write reviews for products. RiverSite is designed to be extremely user friendly with minimum amount of navigation. The app layout is generally clean and colour scheme is carefully chosen to enhance the outlook of the app. Users can put up products to sell or buy products with minimum amount of effort. Stripe integrated payment system is a breeze to use. Products average ratings are automatically calculated from individual ratings given from reviews written by users. Further improvements such as messaging system and layout upgrade are planned to provide maximum user experience and satisfaction.

## 2. App Setup

To copy and setup this web app in local machine, do the following steps:
1. Clone this repository from GitHub and cd into the directory.
2. Run ```bundle install``` in the terminal to install the required gems.
3. Run ```rails db:migrate``` in the terminal to generate database.
4. Create a ```.env``` file in the root of the app directory and type in the your own credential keys into the file:
 * POSTGRES_PASS=XXXX
 * GMAIL_USERNAME=XXXX
 * GMAIL_PASSWORD=XXXX
 * STRIPE_PUBLISHABLE_KEY=XXXX
 * STRIPE_SECRET_KEY=XXXX
5. Add the ```.env``` file at the bottom of ```.gitignore``` file to protect credential keys.

## 3. User Stories

![User Stories Image](/app/assets/images/user-stories.png)

## 4. User Journey Workflow

![User Journey 1 Image](/app/assets/images/user-journey1.jpg)
![User Journey 2 Image](/app/assets/images/user-journey2.jpg)
![User Journey 3 Image](/app/assets/images/user-journey3.jpg)

## 5. Entity Relation Diagram

![ERD Image](/app/assets/images/ERD.jpg)

## 6. Wireframes

![Wireframe 1 Image](/app/assets/images/wireframe1.png)
![Wireframe 2 Image](/app/assets/images/wireframe2.png)
![Wireframe 3 Image](/app/assets/images/wireframe3.png)
![Wireframe 4 Image](/app/assets/images/wireframe4.png)
![Wireframe 5 Image](/app/assets/images/wireframe5.png)
![Wireframe 6 Image](/app/assets/images/wireframe6.png)
![Wireframe 7 Image](/app/assets/images/wireframe7.png)

## 7. Project Plan

 + Day 1 to 2 - User stories, ERD and wireframes
 + Day 2 to 4 - Setting up models and attributes
 + Day 3 to 7 - Implement app features
 + Day 5 to 9 - Styling, code refactor and deployment
 + Day 9 to 10 - Design documentation and assignment submission

## 8. List of Tools

1. Ruby - Main programming language
2. Rails - Web development framework
3. SCSS - CSS preprocessor for web app styling
4. Heroku - Deployment web hosting
5. Namecheap - Custom domain name
6. PostgreSQL - Database
7. Devise - User Authentication
8. Carrierwave - Image uploads
9. Cloudinary - Image cloud hosting
10. Stripe - Payment system
11. Gmail - Transactional email system
12. Dotenv - Environment keys
13. Git - Version control
14. GitHub - Open source code base
15. Trello - User stories
16. Draw.io - ERD and wireframes
17. Atom - Text editor
18. Code review with peers

## 9. Future Development
 - Implement internal messaging system
 - Implement Stripe Connect so that buyer can make payment directly to seller
 - Introduce user ratings system
