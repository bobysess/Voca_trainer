class TrainerController < ApplicationController

  before_filter :set_dicos , only: :training



   def  training
     file_name=Rails.root.join("voca/#{params[:lang]}/#{params[:file]}.txt")
     @lang=params[:lang]
     f = File.open(file_name, "r")
     @words=[]
     f.each_line do |line|
       # wort=line.tr(" /n","")
       @words << line #wort
     end
    # @words = []<< @words.sample;
     @dico =  @dicos[@lang];
     f.close

   end

  def languages
     @languages = Dir.entries(Rails.root.join("voca"))
     @languages.delete(".")
     @languages.delete("..")

  end

  def language
     @lang = params[:lang]
     @files = Dir.entries(Rails.root.join("voca/#{@lang}"))
     @files.delete(".")
     @files.delete("..")
     #remove the  '.txt' am end all files name
     @files.each {|file|  file.slice!('.txt') ;}
  end

  def set_dicos
    @en_dicos = {
        "pons"=>'http://de.pons.com/%C3%BCbersetzung?q=#{word}&l=enfr&in=&lf=en',
        "oxford"=> 'http://www.oxforddictionaries.com/definition/english/#{word}',
        "wordreference"=>'http://www.wordreference.com/enfr/#{word}',
        "linguee"=>'http://www.linguee.com/english-french/search?source=auto&query=#{word}',
        "reverso"=>'http://dictionnaire.reverso.net/anglais-francais/#{word}',
        "dictionary"=>'http://www.vocabulary.com/dictionary/#{word}',
        "images"=>'https://www.google.de/search?q=#{word}&newwindow=1&espv=2&biw=1152&bih=583&source=lnms&tbm=isch&sa=X&ved=0CAYQ_AUoAWoVChMIypXBgoCnyAIVITJyCh0Qpg1u'
    }
    @de_dicos = {
        "duden"=>'http://www.duden.de/rechtschreibung/#{word}',
        "reverso"=>'http://dictionnaire.reverso.net/allemand-francais/#{word}',
        "linguee"=>'http://www.linguee.de/deutsch-franzoesisch/search?query=#{word}',
        "images"=>'https://www.google.de/search?q=#{word}&newwindow=1&espv=2&biw=1152&bih=583&source=lnms&tbm=isch&sa=X&ved=0CAYQ_AUoAWoVChMIypXBgoCnyAIVITJyCh0Qpg1u'
    };
    @fr_dicos = {"larousse"=>'http://www.larousse.fr/dictionnaires/francais/#{word}',
                 "reverso"=>'http://www.linternaute.com/dictionnaire/fr/definition/#{word}',
                 "wiki"=>'http://fr.wiktionary.org/wiki/#{word}',
                 "linguee" =>'http://www.linguee.de/deutsch-franzoesisch/search?source=franzoesisch&query=#{word}',
                 "images"=>'https://www.google.de/search?q=#{word}&newwindow=1&espv=2&biw=1152&bih=583&source=lnms&tbm=isch&sa=X&ved=0CAYQ_AUoAWoVChMIypXBgoCnyAIVITJyCh0Qpg1u'
    }
    @dicos = {'en'=>@en_dicos, 'de' => @de_dicos, 'fr'=>@fr_dicos};
  end
end