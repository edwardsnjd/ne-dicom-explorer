FROM ruby:alpine

RUN gem install dicom -v 0.9.8

# Image support
RUN apk add build-base pkgconfig imagemagick imagemagick-dev imagemagick-libs
RUN gem install rmagick

COPY print.rb .

ENTRYPOINT ["ruby", "print.rb"]
