load("D:/New Folder (2)/Rscripts/preprint_growth.rda") 
head(preprint_growth)
preprint_growth %>% filter(archive == "bioRxiv") %>%
  filter(count > 0) -> biorxiv_growth
preprints<-preprint_growth %>% filter(archive %in%
                                        c("bioRxiv", "arXiv q-bio", "PeerJ Preprints")) %>%filter(count > 0) %>%
  mutate(archive = factor(archive, levels = c("bioRxiv", "arXiv q-bio", "PeerJ Preprints")))

preprints_final <- filter(preprints, date == ymd("2016-06-01"))#Changed Date Here and at end
ggplot(preprints) +
  aes(date, count, color = archive, fill = archive, shape = archive) + 
  geom_line(size = 1) + 
  scale_y_continuous(
    limits = c(0, 600), expand = c(0, 0),
    name = "preprints / month",
    sec.axis = dup_axis(
      breaks = preprints_final$count,
      labels = c("arXiv\nq-bio", "PeerJ\nPreprints", "bioRxiv"),
      name = NULL)
  ) + 
  scale_x_date(name = "year",
               limits = c(min(biorxiv_growth$date), ymd("2016-06-01")), #changed date
               expand = expand_scale(mult = c(0.02, 0))) +
  scale_color_manual(values = c("#800080", "#008080", "#FFD700"),#changed colors
                     name = NULL) +
  theme(legend.position = "none")
        