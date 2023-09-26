-- CreateTable
CREATE TABLE `Users` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NULL,
    `email_verified_at` DATETIME(3) NULL,
    `password` VARCHAR(191) NULL,
    `remember_token` VARCHAR(100) NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `auth_token` LONGTEXT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `default_address_id` INTEGER UNSIGNED NULL,
    `delivery_pin` VARCHAR(191) NULL,
    `delivery_guy_detail_id` INTEGER UNSIGNED NULL,
    `avatar` TEXT NULL,
    `is_active` TINYINT NOT NULL DEFAULT 1,
    `tax_number` VARCHAR(191) NULL,
    `user_ip` TEXT NULL,

    UNIQUE INDEX `Users_phone_key`(`phone`),
    UNIQUE INDEX `Users_delivery_guy_detail_id_key`(`delivery_guy_detail_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Delivery_guy_details` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `age` VARCHAR(191) NULL,
    `gender` VARCHAR(191) NULL,
    `photo` VARCHAR(191) NULL,
    `description` VARCHAR(191) NULL,
    `vehicle_number` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `commision_rate` DECIMAL(8, 2) NOT NULL DEFAULT 5.00,
    `is_notifiable` TINYINT NULL DEFAULT 0,
    `max_accept_delivery_limit` INTEGER NOT NULL DEFAULT 100,
    `delivery_lat` VARCHAR(191) NULL,
    `delivery_long` VARCHAR(191) NULL,
    `heading` VARCHAR(191) NULL,
    `tip_commision_rate` DECIMAL(8, 2) NOT NULL DEFAULT 100.00,
    `status` TINYINT NOT NULL DEFAULT 1,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Address` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `address` TEXT NULL,
    `house` TEXT NULL,
    `landmark` TEXT NULL,
    `tag` TEXT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `latitude` VARCHAR(191) NULL,
    `longitude` VARCHAR(191) NULL,

    UNIQUE INDEX `Address_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Accept_deliveries` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `order_id` INTEGER UNSIGNED NOT NULL,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `is_complete` TINYINT NULL DEFAULT 0,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    UNIQUE INDEX `Accept_deliveries_order_id_key`(`order_id`),
    UNIQUE INDEX `Accept_deliveries_user_id_key`(`user_id`),
    UNIQUE INDEX `Accept_deliveries_customer_id_key`(`customer_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Orders` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `unique_order_id` VARCHAR(191) NOT NULL,
    `orderstatus_id` INTEGER UNSIGNED NOT NULL,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `coupon_name` VARCHAR(191) NULL,
    `location` MEDIUMTEXT NULL,
    `address` VARCHAR(191) NOT NULL,
    `tax` DECIMAL(20, 2) NULL,
    `restaurant_charge` DECIMAL(20, 2) NULL,
    `delivery_charge` DECIMAL(20, 2) NULL,
    `total` DECIMAL(20, 2) NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `payment_mode` VARCHAR(191) NOT NULL,
    `order_comment` TEXT NULL,
    `restaurant_id` INTEGER UNSIGNED NOT NULL,
    `transaction_id` INTEGER UNSIGNED NOT NULL,
    `delivery_type` INTEGER NOT NULL DEFAULT 1,
    `payable` DECIMAL(20, 2) NOT NULL DEFAULT 0.00,
    `wallet_amount` DECIMAL(8, 2) NULL,
    `tip_amount` DECIMAL(8, 2) NULL,
    `tax_amount` DECIMAL(8, 2) NULL,
    `coupon_amount` DECIMAL(8, 2) NULL,
    `coupon_isrestaurant` TINYINT NOT NULL DEFAULT 1,
    `sub_total` DECIMAL(8, 2) NULL,
    `cash_change_amount` INTEGER NULL,
    `restaurant_tax` VARCHAR(255) NULL,
    `online_payment_status` TEXT NULL,
    `rain_charge` DECIMAL(20, 2) NOT NULL,
    `extra_charge` DECIMAL(20, 2) NOT NULL,
    `extra_title` VARCHAR(191) NULL DEFAULT 'Rain Surge',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Orderstatuses` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Restaurants` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `location_id` VARCHAR(191) NULL,
    `image` VARCHAR(191) NULL,
    `rating` VARCHAR(191) NULL,
    `delivery_time` VARCHAR(191) NULL,
    `price_range` VARCHAR(191) NULL,
    `is_pureveg` TINYINT NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `slug` VARCHAR(191) NULL,
    `placeholder_image` VARCHAR(191) NULL,
    `latitude` VARCHAR(191) NULL,
    `longitude` VARCHAR(191) NULL,
    `certificate` VARCHAR(191) NULL,
    `restaurant_charge` DECIMAL(20, 2) NULL,
    `delivery_charges` DECIMAL(20, 2) NULL,
    `address` TEXT NOT NULL,
    `pincode` VARCHAR(191) NULL,
    `landmark` TEXT NULL,
    `sku` VARCHAR(191) NOT NULL,
    `is_active` TINYINT NOT NULL DEFAULT 0,
    `is_accepted` TINYINT NOT NULL DEFAULT 0,
    `is_feature` TINYINT NOT NULL DEFAULT 0,
    `commission_rate` DECIMAL(8, 2) NOT NULL DEFAULT 0.00,
    `delivery_type` INTEGER NOT NULL DEFAULT 1,
    `delivery_radius` DECIMAL(8, 2) NOT NULL DEFAULT 10.00,
    `delivery_charge_type` VARCHAR(191) NOT NULL DEFAULT 'FIXED',
    `base_delivery_charge` DECIMAL(20, 2) NULL,
    `base_delivery_distance` INTEGER NULL,
    `extra_delivery_charge` DECIMAL(20, 2) NULL,
    `extra_delivery_distance` INTEGER NULL,
    `min_order_price` DECIMAL(20, 2) NOT NULL DEFAULT 0.00,
    `is_notifiable` TINYINT NULL DEFAULT 0,
    `auto_acceptable` TINYINT NOT NULL DEFAULT 0,
    `schedule_data` LONGTEXT NULL,
    `is_schedulable` TINYINT NOT NULL DEFAULT 0,
    `order_column` INTEGER NULL,
    `custom_message` LONGTEXT NULL,
    `is_orderschedulling` TINYINT NOT NULL DEFAULT 0,

    UNIQUE INDEX `Restaurants_slug_key`(`slug`),
    UNIQUE INDEX `Restaurants_sku_key`(`sku`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Transaction` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `payable_type` VARCHAR(191) NOT NULL,
    `payable_id` BIGINT UNSIGNED NOT NULL,
    `wallet_id` INTEGER UNSIGNED NULL,
    `type` ENUM('deposit', 'withdraw') NOT NULL,
    `amount` BIGINT NOT NULL,
    `confirmed` TINYINT NOT NULL,
    `meta` LONGTEXT NULL,
    `uuid` CHAR(36) NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Addons` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `price` DECIMAL(20, 2) NOT NULL,
    `addon_category_id` INTEGER UNSIGNED NOT NULL,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `is_active` TINYINT NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Addon_categories` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NULL,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `description` TEXT NULL,
    `addon_limit` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Addon_category_item` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `addon_category_id` INTEGER UNSIGNED NOT NULL,
    `item_id` INTEGER UNSIGNED NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Items` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `restaurant_id` INTEGER UNSIGNED NOT NULL,
    `item_category_id` INTEGER UNSIGNED NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `price` DECIMAL(20, 2) NOT NULL,
    `old_price` DECIMAL(20, 2) NOT NULL DEFAULT 0.00,
    `image` VARCHAR(191) NULL,
    `is_recommended` TINYINT NOT NULL,
    `is_popular` TINYINT NOT NULL,
    `is_new` TINYINT NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `desc` LONGTEXT NULL,
    `placeholder_image` VARCHAR(191) NULL,
    `is_active` TINYINT NOT NULL DEFAULT 1,
    `is_veg` TINYINT NULL,
    `order_column` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Alerts` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `data` LONGTEXT NULL,
    `user_id` INTEGER UNSIGNED NULL,
    `is_read` TINYINT NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Branch` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `is_franchise` TINYINT NOT NULL DEFAULT 0,
    `is_active` TINYINT NOT NULL DEFAULT 1,
    `restaurant_id` INTEGER UNSIGNED NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Coupons` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,
    `description` VARCHAR(191) NULL,
    `code` VARCHAR(191) NOT NULL,
    `success_count` INTEGER NOT NULL DEFAULT 0,
    `success_amount` DECIMAL(20, 0) NOT NULL,
    `discount_type` VARCHAR(191) NOT NULL,
    `discount` VARCHAR(191) NOT NULL,
    `expiry_date` DATETIME(3) NULL,
    `is_active` TINYINT NOT NULL DEFAULT 0,
    `is_restaurant` TINYINT NOT NULL DEFAULT 1,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `restaurant_id` INTEGER UNSIGNED NULL,
    `count` INTEGER NOT NULL DEFAULT 0,
    `max_count` INTEGER NOT NULL DEFAULT 1,
    `min_subtotal` DECIMAL(20, 2) NOT NULL DEFAULT 0.00,
    `max_discount` DECIMAL(20, 2) NULL,
    `subtotal_message` VARCHAR(191) NULL,
    `user_type` VARCHAR(191) NULL,
    `max_count_per_user` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Coupon_restaurant` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `coupon_id` INTEGER UNSIGNED NOT NULL,
    `restaurant_id` INTEGER UNSIGNED NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Delivery_collections` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `amount` DECIMAL(20, 2) NOT NULL DEFAULT 0.00,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Delivery_collection_logs` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `delivery_collection_id` INTEGER UNSIGNED NOT NULL,
    `amount` DECIMAL(20, 2) NOT NULL,
    `type` VARCHAR(191) NULL,
    `message` LONGTEXT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `favorites` (
    `user_id` INTEGER UNSIGNED NOT NULL,
    `favoriteable_type` VARCHAR(191) NOT NULL,
    `favoriteable_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`favoriteable_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Incentives` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `delivery_guy_detail_id` INTEGER UNSIGNED NULL,
    `total_order` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `delivery_charge` DECIMAL(20, 2) NULL,
    `extra_delivery_charge` DECIMAL(20, 2) NULL,
    `delivery_tip` DECIMAL(20, 2) NULL,
    `incentive` DECIMAL(20, 2) NULL,
    `extra_amount` DECIMAL(20, 2) NULL,
    `total_amount` DECIMAL(20, 2) NULL DEFAULT 0.00,
    `incentive_date` DATETIME(3) NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `extra_surge` DECIMAL(20, 2) NOT NULL DEFAULT 0.00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `item_categories` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `is_enabled` TINYINT NOT NULL DEFAULT 1,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `order_column` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Orderitems` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `order_id` INTEGER UNSIGNED NOT NULL,
    `item_id` INTEGER UNSIGNED NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `price` DECIMAL(20, 2) NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order_item_addons` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `orderitem_id` INTEGER UNSIGNED NOT NULL,
    `addon_category_name` VARCHAR(191) NOT NULL,
    `addon_name` VARCHAR(191) NOT NULL,
    `addon_price` DECIMAL(20, 2) NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pages` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `body` LONGTEXT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    UNIQUE INDEX `Pages_slug_key`(`slug`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Promo_sliders` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `is_active` TINYINT NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `location_id` INTEGER NULL,
    `position_id` INTEGER NOT NULL DEFAULT 0,
    `size` INTEGER NOT NULL DEFAULT 5,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Push_tokens` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `token` LONGTEXT NOT NULL,
    `status` TINYINT NOT NULL DEFAULT 0,
    `is_sent` TINYINT NOT NULL DEFAULT 0,
    `is_active` TINYINT NOT NULL DEFAULT 1,
    `user_id` INTEGER UNSIGNED NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Ratings` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `order_id` INTEGER UNSIGNED NOT NULL,
    `restaurant_id` INTEGER UNSIGNED NOT NULL,
    `delivery_id` INTEGER UNSIGNED NULL,
    `rating_store` INTEGER NULL,
    `rating_delivery` INTEGER NULL,
    `review_store` TEXT NULL,
    `review_delivery` TEXT NULL,
    `is_active` TINYINT NOT NULL DEFAULT 1,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Referrals` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `referral_code` VARCHAR(191) NULL,
    `refer_from` VARCHAR(191) NULL,
    `refer_to` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Restaurant_categories` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `is_active` TINYINT NOT NULL DEFAULT 1,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Restaurant_category_restaurant` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `restaurant_category_id` INTEGER UNSIGNED NOT NULL,
    `restaurant_id` INTEGER UNSIGNED NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Restaurant_category_sliders` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `image` TEXT NULL,
    `image_placeholder` TEXT NULL,
    `categories_ids` LONGTEXT NOT NULL,
    `is_active` TINYINT NOT NULL DEFAULT 1,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `order_column` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Restaurant_earnings` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `restaurant_id` INTEGER UNSIGNED NOT NULL,
    `user_id` INTEGER UNSIGNED NULL,
    `amount` DECIMAL(20, 2) NOT NULL DEFAULT 0.00,
    `extra` DECIMAL(20, 2) NOT NULL DEFAULT 0.00,
    `is_requested` TINYINT NOT NULL DEFAULT 0,
    `is_processed` TINYINT NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `restaurant_payout_id` INTEGER UNSIGNED NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Restaurant_payouts` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `restaurant_id` INTEGER UNSIGNED NOT NULL,
    `restaurant_earning_id` INTEGER UNSIGNED NOT NULL,
    `amount` DECIMAL(20, 2) NOT NULL DEFAULT 0.00,
    `status` VARCHAR(191) NOT NULL,
    `transaction_mode` VARCHAR(191) NULL,
    `transaction_id` INTEGER UNSIGNED NULL,
    `message` LONGTEXT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Restaurant_user` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `restaurant_id` INTEGER UNSIGNED NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Roles` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `guard_name` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Settings` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `key` VARCHAR(191) NOT NULL,
    `value` LONGTEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Slides` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `promo_slider_id` INTEGER UNSIGNED NOT NULL,
    `unique_id` VARCHAR(191) NULL,
    `name` VARCHAR(191) NULL,
    `image` TEXT NULL,
    `image_placeholder` TEXT NULL,
    `url` TEXT NULL,
    `is_active` TINYINT NOT NULL DEFAULT 1,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,
    `order_column` INTEGER NULL,
    `model` VARCHAR(191) NULL,
    `item_id` INTEGER UNSIGNED NULL,
    `restaurant_id` INTEGER UNSIGNED NULL,
    `is_locationset` TINYINT NOT NULL DEFAULT 0,
    `latitude` VARCHAR(191) NULL,
    `longitude` VARCHAR(191) NULL,
    `radius` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Transactions` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `payable_type` VARCHAR(191) NOT NULL,
    `payable_id` BIGINT UNSIGNED NOT NULL,
    `wallet_id` INTEGER UNSIGNED NULL,
    `type` ENUM('deposit', 'withdraw') NOT NULL,
    `amount` BIGINT NOT NULL,
    `confirmed` TINYINT NOT NULL,
    `meta` LONGTEXT NULL,
    `uuid` CHAR(36) NOT NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Wallets` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `holder_type` VARCHAR(191) NOT NULL,
    `holder_id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `balance` BIGINT NOT NULL DEFAULT 0,
    `decimal_places` SMALLINT NOT NULL DEFAULT 2,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Users` ADD CONSTRAINT `Users_delivery_guy_detail_id_fkey` FOREIGN KEY (`delivery_guy_detail_id`) REFERENCES `Delivery_guy_details`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Users` ADD CONSTRAINT `Users_default_address_id_fkey` FOREIGN KEY (`default_address_id`) REFERENCES `Address`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Address` ADD CONSTRAINT `Address_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Accept_deliveries` ADD CONSTRAINT `Accept_deliveries_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Orders`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Accept_deliveries` ADD CONSTRAINT `Accept_deliveries_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Accept_deliveries` ADD CONSTRAINT `Accept_deliveries_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Orders` ADD CONSTRAINT `Orders_orderstatus_id_fkey` FOREIGN KEY (`orderstatus_id`) REFERENCES `Orderstatuses`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Orders` ADD CONSTRAINT `Orders_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Orders` ADD CONSTRAINT `Orders_restaurant_id_fkey` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Orders` ADD CONSTRAINT `Orders_transaction_id_fkey` FOREIGN KEY (`transaction_id`) REFERENCES `Transaction`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_wallet_id_fkey` FOREIGN KEY (`wallet_id`) REFERENCES `Wallets`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Addons` ADD CONSTRAINT `Addons_addon_category_id_fkey` FOREIGN KEY (`addon_category_id`) REFERENCES `Addon_categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Addons` ADD CONSTRAINT `Addons_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Addon_categories` ADD CONSTRAINT `Addon_categories_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Addon_category_item` ADD CONSTRAINT `Addon_category_item_addon_category_id_fkey` FOREIGN KEY (`addon_category_id`) REFERENCES `Addon_categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Addon_category_item` ADD CONSTRAINT `Addon_category_item_item_id_fkey` FOREIGN KEY (`item_id`) REFERENCES `Items`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Items` ADD CONSTRAINT `Items_restaurant_id_fkey` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Items` ADD CONSTRAINT `Items_item_category_id_fkey` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Alerts` ADD CONSTRAINT `Alerts_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Branch` ADD CONSTRAINT `Branch_restaurant_id_fkey` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Coupons` ADD CONSTRAINT `Coupons_restaurant_id_fkey` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Coupon_restaurant` ADD CONSTRAINT `Coupon_restaurant_coupon_id_fkey` FOREIGN KEY (`coupon_id`) REFERENCES `Coupons`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Coupon_restaurant` ADD CONSTRAINT `Coupon_restaurant_restaurant_id_fkey` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Delivery_collections` ADD CONSTRAINT `Delivery_collections_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Delivery_collection_logs` ADD CONSTRAINT `Delivery_collection_logs_delivery_collection_id_fkey` FOREIGN KEY (`delivery_collection_id`) REFERENCES `Delivery_collections`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `favorites` ADD CONSTRAINT `favorites_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Incentives` ADD CONSTRAINT `Incentives_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Incentives` ADD CONSTRAINT `Incentives_delivery_guy_detail_id_fkey` FOREIGN KEY (`delivery_guy_detail_id`) REFERENCES `Delivery_guy_details`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item_categories` ADD CONSTRAINT `item_categories_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Orderitems` ADD CONSTRAINT `Orderitems_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Orders`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Orderitems` ADD CONSTRAINT `Orderitems_item_id_fkey` FOREIGN KEY (`item_id`) REFERENCES `Items`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order_item_addons` ADD CONSTRAINT `Order_item_addons_orderitem_id_fkey` FOREIGN KEY (`orderitem_id`) REFERENCES `Orderitems`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Push_tokens` ADD CONSTRAINT `Push_tokens_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ratings` ADD CONSTRAINT `Ratings_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ratings` ADD CONSTRAINT `Ratings_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Orders`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ratings` ADD CONSTRAINT `Ratings_restaurant_id_fkey` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ratings` ADD CONSTRAINT `Ratings_delivery_id_fkey` FOREIGN KEY (`delivery_id`) REFERENCES `Delivery_guy_details`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Restaurant_category_restaurant` ADD CONSTRAINT `Restaurant_category_restaurant_restaurant_category_id_fkey` FOREIGN KEY (`restaurant_category_id`) REFERENCES `Restaurant_categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Restaurant_category_restaurant` ADD CONSTRAINT `Restaurant_category_restaurant_restaurant_id_fkey` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Restaurant_earnings` ADD CONSTRAINT `Restaurant_earnings_restaurant_id_fkey` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Restaurant_earnings` ADD CONSTRAINT `Restaurant_earnings_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Restaurant_earnings` ADD CONSTRAINT `Restaurant_earnings_restaurant_payout_id_fkey` FOREIGN KEY (`restaurant_payout_id`) REFERENCES `Restaurant_payouts`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Restaurant_payouts` ADD CONSTRAINT `Restaurant_payouts_restaurant_id_fkey` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Restaurant_payouts` ADD CONSTRAINT `Restaurant_payouts_restaurant_earning_id_fkey` FOREIGN KEY (`restaurant_earning_id`) REFERENCES `Restaurant_earnings`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Restaurant_payouts` ADD CONSTRAINT `Restaurant_payouts_transaction_id_fkey` FOREIGN KEY (`transaction_id`) REFERENCES `Transactions`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Restaurant_user` ADD CONSTRAINT `Restaurant_user_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Restaurant_user` ADD CONSTRAINT `Restaurant_user_restaurant_id_fkey` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Slides` ADD CONSTRAINT `Slides_promo_slider_id_fkey` FOREIGN KEY (`promo_slider_id`) REFERENCES `Promo_sliders`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Slides` ADD CONSTRAINT `Slides_item_id_fkey` FOREIGN KEY (`item_id`) REFERENCES `Items`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Slides` ADD CONSTRAINT `Slides_restaurant_id_fkey` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurants`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
