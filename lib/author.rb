class Author
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def posts
        Post.all.filter do |post|
            self == post.author
       end
    end

    def add_post(post)
        post.author = self
    end

    def add_post_by_title(post_title)
        new_post = Post.new(post_title)
        add_post(new_post)
    end


    def self.post_count
        posts_with_authors = Post.all.filter do |post|
            post.author
        end
        posts_with_authors.length
    end

end