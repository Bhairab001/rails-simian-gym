namespace :security do
  desc "run dirb"
  task dirb: :environment do
    sh('gauntlt gauntlt/dirb/*')
  end

  desc "garmr"
  task garmr: :environment do
    sh('gauntlt gauntlt/dirb/*')
  end

  desc "gauntlt"
  task gauntlt: :environment do
    sh('gauntlt gauntlt')
  end

end
