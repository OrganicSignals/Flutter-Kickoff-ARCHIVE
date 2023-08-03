import 'package:flutter/material.dart';
import 'package:udemytest/models/bag.dart';
import 'package:udemytest/models/categoey.dart';

const availableCategories = [
  Category(
      id: '1',
      name: 'Sling Bags',
      color: Color.fromARGB(255, 90, 173, 242),
      catImage: "assets/categoryImages/MerlinSling.jpg"),
  Category(
    id: '2',
    name: 'Sunshine',
    color: Color.fromARGB(255, 90, 173, 242),
    catImage: "assets/categoryImages/sunshine.jpg",
  ),
  Category(
    id: '3',
    name: 'Tote Bags',
    color: Color.fromARGB(255, 90, 173, 242),
    catImage: "assets/categoryImages/toteBag.jpg",
  ),
  Category(
    id: '4',
    name: 'Vanity Pouches',
    color: Color.fromARGB(255, 90, 173, 242),
    catImage: "assets/categoryImages/vanity pocuh 4.jpg",
  ),
  Category(
    id: '5',
    name: 'Pouches',
    color: Color.fromARGB(255, 90, 173, 242),
    catImage: "assets/categoryImages/medium-travel.jpg",
  ),
  Category(
    id: '6',
    name: 'Duffle bags',
    color: Color.fromARGB(255, 90, 173, 242),
    catImage: "assets/categoryImages/duffleBag.jpg",
  )
];

const dummyBags = [
  Bag(
      bagName: //'Maroon Warli print-Bluebell Sling',
          'Maroon Sling',
      id: 'b1',
      categories: ['1'],
      imageUrl:
          //'https://swadeshibrands.in/wp-content/uploads/2023/02/IMG_20230206_160205-scaled.jpg',
          'assets/bags/maroonWaraliSling.jpg',
      material: ['Beautiful cotton fabric', 'purse lining'],
      description: [
        'Size- L10" by H7" by B3.5"',
        'Main compartment with zip closure.'
            'Our products are handmade and may have slightly irregularities that are natural outcome of the human involvement in the process.'
      ],
      look: Look.simple,
      price: 250.00,
      affordability: Affordability.affordable,
      isCottonFabric: true),
  Bag(
      bagName: 'Ikkat-Sunshine Bag',
      id: 'b2',
      categories: ['2'],
      imageUrl:
          //'https://swadeshibrands.in/wp-content/uploads/2022/12/sunshine-16.png',
          'assets/bags/ikkatSunshine.jpg',
      material: ['Beautiful Ikkat/Jaipuri fabric', 'purse lining (waterproof)'],
      description: [
        'Size L16" by H12" by W4"',
        '1 Main compartment zip closure.',
        'Inside 1 pocket and 1 zip pocket.',
        'Strong and sturdy shoulder belts.',
        'Our products are handmade and may have slightly irregularities that are natural outcome of the human involvement in the process.'
      ],
      look: Look.trendy,
      price: 350.00,
      affordability: Affordability.affordable,
      isCottonFabric: true),
  Bag(
      bagName: 'Ikkat Print Purse',
      id: 'b3',
      categories: ['3'],
      imageUrl:
          //'https://swadeshibrands.in/wp-content/uploads/2023/02/IMG_20230201_163943-scaled.jpg',
          'assets/bags/ikkatPrintPurse.jpg',
      material: ['Beautiful Ikkat/Jaipuri fabric', 'purse lining (waterproof)'],
      description: [
        'Size in inches: 12" by 13" by 3""',
        'Main compartment with zip closure.Inside 1 zips compartment, 1 slip pocket.Back side full length zip compartment.Fabric shoulder belts for firm grip',
      ],
      look: Look.trendy,
      price: 170.00,
      affordability: Affordability.affordable,
      isCottonFabric: false),
  Bag(
      bagName: 'Travel Pouch Medium',
      id: 'b4',
      categories: ['4'],
      imageUrl:
          //'https://swadeshibrands.in/wp-content/uploads/2023/02/IMG_20230201_144314-scaled.jpg',
          'assets/bags/travelPouch.jpg',
      material: ['Best quality cotton fabric', 'inside purse lining'],
      description: [
        'Main zip Compartment',
        'Front side 1 zip compartment',
        'Suitable for carrying basic stuff while on the move',
        'Can be used Stationery pouch/accessories pouch/shaving kit.',
        'Product colour may vary due to technical reasons.'
      ],
      look: Look.trendy,
      price: 350.00,
      affordability: Affordability.luxurious,
      isCottonFabric: false),
  Bag(
      bagName: 'Travel Pouch Long',
      id: 'b5',
      categories: ['5'],
      imageUrl:
          //'https://swadeshibrands.in/wp-content/uploads/2023/02/IMG_20230201_153428-scaled.jpg',
          'assets/bags/travelPouchLong.jpg',
      material: ['est Quality Cotton fabric'],
      description: [
        'Size in inches: 12" by 13" by 3""',
        'Spacious Main 1 Zip Compartment, front and back 1 zip compartment respectively. Total 3 zip compartments.Easy to wash , Good zipper qualityUseful to carrypower bank, charger, cosmetics, accessories, as stationery pouch.Products colours may vary due to technical reasons.Courier charges applicable.',
      ],
      look: Look.trendy,
      price: 370.00,
      affordability: Affordability.affordable,
      isCottonFabric: true),
  Bag(
      bagName: 'Ikkat Print Purse',
      id: 'b6',
      categories: ['6'],
      imageUrl:
          //'https://swadeshibrands.in/wp-content/uploads/2022/12/DB-Image-2.png',
          'assets/bags/ikkatPurse.jpg',
      material: ['cotton fabricInside purse lining'],
      description: [
        'Size in inches: 12" by 13" by 3""',
        '2 side pocketsShoulder BeltsPouch Available fabric choice will be provided.Make to order.50% advance payment for order confirmation.After order confirm, 7 to 8 days making and delivery time.Product colour ayslightly vary due technical reasons.',
      ],
      look: Look.trendy,
      price: 350.00,
      affordability: Affordability.affordable,
      isCottonFabric: false),
  Bag(
      bagName: 'Travel Pouch Medium',
      id: 'b7',
      categories: ['4'],
      imageUrl:
          //'https://swadeshibrands.in/wp-content/uploads/2023/02/IMG_20230201_143854-scaled.jpg',
          'assets/bags/vanitypouch.jpg',
      material: ['cotton fabricInside purse lining'],
      description: [
        'Size in inches: 12" by 13" by 3""',
        'nside purse liningMain zip Compartment Front side 1 zip compartmentSuitable for carrying basic stuff while on the moveCan be used Stationery pouch/accessoriesouch/shaving kit.Product colour may vary due to technical reasons.Courier Charges Applicable.',
      ],
      look: Look.trendy,
      price: 350.00,
      affordability: Affordability.affordable,
      isCottonFabric: true),
  Bag(
      bagName: 'Travel Pouch Medium',
      id: 'b8',
      categories: ['4'],
      imageUrl:
          //'https://swadeshibrands.in/wp-content/uploads/2023/02/IMG_20230201_144005-scaled.jpg',
          'assets/bags/travelPouchMediumPolkaDot.jpg',
      material: ['cotton fabricInside purse lining'],
      description: [
        'Size in inches: 12" by 13" by 3""',
        'inside purse liningMain zip Compartment Front side 1 zip compartmentSuitable for carrying basic stuff while on the moveCan be used Stationery pouch/accessoriesouch/shaving kit.Product colour may vary due to technical reasons.Courier Charges Applicable.',
      ],
      look: Look.trendy,
      price: 350.00,
      affordability: Affordability.affordable,
      isCottonFabric: false),
  Bag(
      bagName: 'merlin sling',
      id: 'b9',
      categories: ['1'],
      imageUrl:
          //'https://swadeshibrands.in/wp-content/uploads/2023/01/IMG_20230130_113418-scaled.jpg',
          'assets/bags/ashySling.jpg',
      material: ['cotton fabricInside purse lining'],
      description: [
        'Size in inches: 12" by 13" by 3""',
        'inside purse liningMain zip Compartment Front side 1 zip compartmentSuitable for carrying basic stuff while on the moveCan be used Stationery pouch/accessoriesouch/shaving kit.Product colour may vary due to technical reasons.Courier Charges Applicable.',
      ],
      look: Look.trendy,
      price: 300.00,
      affordability: Affordability.affordable,
      isCottonFabric: false),
  Bag(
      bagName: 'ashy prinia sling',
      id: 'b10',
      categories: ['1'],
      imageUrl:
          //'https://swadeshibrands.in/wp-content/uploads/2023/01/IMG_20230130_105353-scaled.jpg',
          'assets/bags/blueSling.jpg',
      material: ['cotton fabricInside purse lining'],
      description: [
        'Size in inches: 12" by 13" by 3""',
        'inside purse liningMain zip Compartment Front side 1 zip compartmentSuitable for carrying basic stuff while on the moveCan be used Stationery pouch/accessoriesouch/shaving kit.Product colour may vary due to technical reasons.Courier Charges Applicable.',
      ],
      look: Look.trendy,
      price: 270.00,
      affordability: Affordability.affordable,
      isCottonFabric: true),
];
