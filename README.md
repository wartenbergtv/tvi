# Podi

podcast hosting

## setup an admin user

open rails console

```
user = User.new
user.admin = true
user.email = "test@example.com"
user.first_name = "Super"
user.last_name = "Admin"
user.password = "supersecret"
user.password_confirmation = "supersecret"
user.save!
```

## setup sidemap

configure s3 access

S3_ACCESS_KEY
S3_SECRET_KEY
S3_BUCKET_NAME
S3_REGION

scheduler call
```
rake sitemap:refresh
```

## TODO
