class Cms::BaseCmsController < ApplicationController
    layout 'cms/layouts/application'
  end
  
  
module Cms
  class AuthorsController < BaseCmsController
   
  end
end

module Cms
  class BooksController < BaseCmsController
    
  end
end

module Cms
  class CategoriesController < BaseCmsController
  
  end
end